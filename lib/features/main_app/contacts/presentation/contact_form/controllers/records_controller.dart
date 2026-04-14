// lib/features/main_app/contacts/presentation/contact_form/controllers/records_controller.dart

import 'package:contacts/features/main_app/contacts/presentation/contact_form/utils/field_type_l10n.dart';
import 'package:contacts/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class Record {
  String type;
  final TextEditingController textEditingController;

  Record({required this.type, required this.textEditingController});
}

class RecordsController {
  final ValueNotifier<List<Record>> records;
  final GlobalKey<AnimatedListState> listKey;
  final List<String> types;
  final FieldKind fieldKind;

  static const _insertDuration = Duration(milliseconds: 150);
  static const _removeDuration = Duration(milliseconds: 300);

  static final _disposalDelay = Duration(
    milliseconds: _removeDuration.inMilliseconds + 50,
  );

  RecordsController({
    required this.records,
    required this.listKey,
    required this.types,
    required this.fieldKind,
  });

  List<Record> getNotEmptyRecords() {
    return records.value
        .where((r) => r.textEditingController.text.trim().isNotEmpty)
        .toList();
  }

  void add() {
    final nextType = types[records.value.length % types.length];
    final textEditingController = TextEditingController();
    final index = records.value.length;

    final newRecord = Record(
      type: nextType,
      textEditingController: textEditingController,
    );

    records.value = [...records.value, newRecord];

    listKey.currentState?.insertItem(index, duration: _insertDuration);
  }

  void addWithData({required String initialText, required String initialType}) {
    final textEditingController = TextEditingController(text: initialText);
    final index = records.value.length;

    final newRecord = Record(
      type: initialType,
      textEditingController: textEditingController,
    );

    records.value = [...records.value, newRecord];

    listKey.currentState?.insertItem(index, duration: _insertDuration);
  }

  void remove(int index) {
    if (records.value.isEmpty || index >= records.value.length) return;

    // Store the item to be removed for the animation builder
    final removedItem = records.value[index];

    // First, tell AnimatedList to remove the item with animation
    listKey.currentState?.removeItem(
      index,
      (context, animation) =>
          _buildRemovedItem(context, removedItem, animation, index),
      duration: _removeDuration,
    );

    // Then update the state by removing from the list
    // This happens immediately but AnimatedList will handle the animation
    final oldRecords = [...records.value];
    oldRecords.removeAt(index);
    records.value = oldRecords;

    // Dispose controller after animation completes
    Future.delayed(_disposalDelay, () {
      removedItem.textEditingController.dispose();
    });
  }

  void updateType(int index, String newType) {
    if (index >= records.value.length) return;
    final updated = [...records.value];
    updated[index].type = newType;
    records.value = updated;
  }

  Widget _buildRemovedItem(
    BuildContext context,
    Record record,
    Animation<double> animation,
    int index,
  ) {
    // Return the actual widget with proper styling during removal
    return SizeTransition(
      sizeFactor: animation,
      child: FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: animation.drive(
            Tween<Offset>(
              begin: const Offset(-0.3, 0),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.easeInCubic)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(4, 0, 4, 8),
            child: Opacity(
              opacity: 0.5,
              child: IgnorePointer(
                child: _buildRemovedItemContent(context, record),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRemovedItemContent(BuildContext context, Record record) {
    return Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Placeholder for remove button
                const SizedBox(width: 48, height: 48),
                const SizedBox(width: 12),

                // Type indicator (simplified)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _typeLabel(context, record.type),
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Text content
                Expanded(
                  child: Text(
                    record.textEditingController.text,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48),
              child: Divider(
                height: 1,
                thickness: 1,
                color: Theme.of(
                  context,
                ).colorScheme.outlineVariant.withValues(alpha: 0.5),
              ),
            ),
          ],
        );
  }

  String _typeLabel(BuildContext context, String type) {
    final l10n = AppLocalizations.of(context);
    if (l10n == null) return type;
    return localizedFieldType(l10n, type, fieldKind);
  }

  void dispose() {
    for (final record in records.value) {
      record.textEditingController.dispose();
    }
  }
}
