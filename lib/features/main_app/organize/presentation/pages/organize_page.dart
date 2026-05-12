import 'package:contacts/l10n/l10n_context.dart';
import 'package:contacts/features/main_app/contacts/domain/contact_merge_policy.dart';
import 'package:contacts/features/main_app/contacts/domain/contact_duplicates.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';
import 'package:contacts/features/main_app/contacts/presentation/contact_form/contact_form.dart';
import 'package:contacts/features/main_app/organize/presentation/mappers/organize_group_presenter.dart';
import 'package:contacts/features/main_app/organize/presentation/providers/organize_providers.dart';
import 'package:contacts/features/main_app/organize/presentation/state/organize_selection_controller.dart';
import 'package:contacts/features/main_app/organize/presentation/widgets/duplicate_group_card.dart';
import 'package:contacts/core/layout/widgets/app_scaffold.dart';
import 'package:contacts/core/purchases/premium_gate.dart';
import 'package:contacts/core/theme/app_breakpoints.dart';
import 'package:contacts/core/theme/app_spacings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrganizePage extends HookConsumerWidget {
  const OrganizePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupsAsync = ref.watch(visibleDuplicateGroupsProvider);
    final skippedAsync = ref.watch(skippedDuplicateGroupIdsProvider);
    final skippedIds = skippedAsync.asData?.value;
    final hasSkippedDuplicateGroups =
        skippedIds != null && skippedIds.isNotEmpty;
    final selectionRevision = useState(0);
    final selectionController = useMemoized(OrganizeSelectionController.new);
    final mergePolicy = useMemoized(() => const ContactMergePolicy());
    final presenter = useMemoized(() => const OrganizeGroupPresenter());
    final displayedGroups = useState<List<DuplicateGroup>>(const []);
    final exitingGroupIds = useState<Set<String>>(<String>{});
    final reduceMotion = MediaQuery.maybeOf(context)?.disableAnimations ?? false;
    const removalAnimationDuration = Duration(milliseconds: 260);

    useEffect(() {
      final latestGroups = groupsAsync.asData?.value;
      if (latestGroups == null) return null;

      if (reduceMotion) {
        displayedGroups.value = latestGroups;
        exitingGroupIds.value = <String>{};
        return null;
      }

      final currentDisplayed = displayedGroups.value;
      if (currentDisplayed.isEmpty) {
        displayedGroups.value = latestGroups;
        exitingGroupIds.value = <String>{};
        return null;
      }

      final latestById = {for (final group in latestGroups) group.id: group};
      final latestIds = latestById.keys.toSet();
      final currentIds = currentDisplayed.map((group) => group.id).toSet();
      final removedIds = currentIds.difference(latestIds);

      final nextDisplayed = <DuplicateGroup>[
        for (final group in currentDisplayed) latestById[group.id] ?? group,
        for (final group in latestGroups)
          if (!currentIds.contains(group.id)) group,
      ];

      final nextExitingIds = <String>{...exitingGroupIds.value, ...removedIds}
        ..removeWhere((id) => latestIds.contains(id));

      // Even if group order is stable, the contacts inside each group may have
      // changed after editing a contact. Keep `displayedGroups` in sync so
      // cards don't render stale contact data.
      displayedGroups.value = nextDisplayed;
      if (!setEquals(exitingGroupIds.value, nextExitingIds)) {
        exitingGroupIds.value = nextExitingIds;
      }
      return null;
    }, [groupsAsync.asData?.value, reduceMotion]);

    final spacing = Theme.of(context).extension<AppSpacings>()!;
    final theme = Theme.of(context);
    final pageHorizontalPadding = AppBreakpoints.responsive<double>(
      context,
      compact: 12,
      wide: spacing.screenPaddingH,
    );
    final listHorizontalPadding = AppBreakpoints.responsive<double>(
      context,
      compact: 8,
      wide: 16,
    );

    void onClearSkipped() {
      ref.read(skippedDuplicateGroupIdsProvider.notifier).clearAll().then((_) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.l10n.organizeSkippedShownAgain),
          ),
        );
      });
    }

    const actionSlotWidth = 48.0;

    return AppScaffold(
      minimumScreenPaddingH: pageHorizontalPadding,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: spacing.screenPaddingH),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: actionSlotWidth),
              Expanded(
                child: Text(
                  context.l10n.organizeTitle,
                  style: theme.textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: actionSlotWidth,
                child: hasSkippedDuplicateGroups
                    ? IconButton(
                        tooltip: context.l10n.organizeShowSkippedTooltip,
                        onPressed:
                            skippedAsync.isLoading ? null : onClearSkipped,
                        icon: const Icon(Icons.refresh),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
          SizedBox(height: spacing.screenPaddingH),
          Expanded(
            child: groupsAsync.when(
              data: (groups) {
                final groupsToRender =
                    reduceMotion ? groups : displayedGroups.value;
                if (groupsToRender.isEmpty) {
                  return Center(
                    child: Text(context.l10n.organizeNoDuplicates),
                  );
                }
                return ListView.builder(
                  padding: EdgeInsets.fromLTRB(
                    listHorizontalPadding,
                    16,
                    listHorizontalPadding,
                    16,
                  ),
                  itemCount: groupsToRender.length,
                  itemBuilder: (context, index) {
                    final group = groupsToRender[index];
                    final isExiting = !reduceMotion &&
                        exitingGroupIds.value.contains(group.id);
                    final selectedIds = selectionController.selectedIdsForGroup(
                      group.id,
                      fallbackContactIds: group.contacts.map((c) => c.id),
                    );
                    final selectedContacts = group.contacts
                        .where((c) => selectedIds.contains(c.id))
                        .toList();

                    final card = DuplicateGroupCard(
                      key: ValueKey(group.id),
                      group: group,
                      selectedIds: selectedIds,
                      presenter: presenter,
                      onSkip: () async {
                        if (!await PremiumGate.ensurePremium(context)) return;
                        await ref
                            .read(skippedDuplicateGroupIdsProvider.notifier)
                            .skip(group.id);
                      },
                      onMerge: selectedContacts.length < 2
                          ? null
                          : () async {
                              if (!await PremiumGate.ensurePremium(context)) {
                                return;
                              }
                              if (!context.mounted) return;
                              _openMergeSheet(
                                context,
                                selectedContacts,
                                mergePolicy,
                              );
                            },
                      onContactTap: (contact) =>
                          context.push('/main_app/organize/${contact.id}'),
                      onToggleSelection: (contact) {
                        selectionController.toggle(
                          groupId: group.id,
                          contactId: contact.id,
                          currentSelection: selectedIds,
                        );
                        selectionRevision.value++;
                      },
                    );

                    if (reduceMotion) return card;

                    return TweenAnimationBuilder<double>(
                      key: ValueKey('animated-${group.id}'),
                      tween: Tween<double>(begin: 1, end: isExiting ? 0 : 1),
                      duration: removalAnimationDuration,
                      curve: Curves.easeInOutCubic,
                      onEnd: () {
                        if (!exitingGroupIds.value.contains(group.id)) {
                          return;
                        }
                        final current = displayedGroups.value;
                        displayedGroups.value = current
                            .where((item) => item.id != group.id)
                            .toList();
                        exitingGroupIds.value = <String>{
                          ...exitingGroupIds.value
                              .where((id) => id != group.id),
                        };
                      },
                      child: card,
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: ClipRect(
                            child: Align(
                              alignment: Alignment.topCenter,
                              heightFactor: value.clamp(0, 1),
                              child: child,
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    context.l10n.organizeFailedToLoad(error.toString()),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openMergeSheet(
    BuildContext context,
    List<Contact> selectedContacts,
    ContactMergePolicy mergePolicy,
  ) {
    final mergedDraft = mergePolicy.mergeAsDraft(selectedContacts);
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      useSafeArea: true,
      clipBehavior: Clip.antiAlias,
      builder: (_) => ContactForm(
        contact: mergedDraft,
        forceCreateMode: true,
        deleteOnSaveIds: selectedContacts.map((contact) => contact.id).toList(),
      ),
    );
  }
}

