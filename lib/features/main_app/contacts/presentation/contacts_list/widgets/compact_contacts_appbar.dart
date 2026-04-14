import 'package:contacts/core/constants/app_constants.dart';
import 'package:contacts/l10n/l10n_context.dart';
import 'package:contacts/core/layout/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CompactContactsAppBar extends HookWidget implements PreferredSizeWidget {
  final String searchQuery;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onClear;

  const CompactContactsAppBar({
    super.key,
    required this.searchQuery,
    required this.onSearchChanged,
    required this.onClear,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isSearchMode = useState(searchQuery.isNotEmpty);
    final controller = useTextEditingController(text: searchQuery);
    final focusNode = useFocusNode();

    useEffect(() {
      if (!isSearchMode.value) {
        controller.clear();
      }
      return null;
    }, [isSearchMode.value]);

    return AppBar(
      forceMaterialTransparency: true,
      automaticallyImplyLeading: false,
      centerTitle: false,
      titleSpacing: 0,
      leadingWidth: 40,
      leading: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.8, end: 1.0).animate(animation),
              child: child,
            ),
          );
        },
        child: isSearchMode.value
            ? IconButton(
                key: const ValueKey('back'),
                icon: const Icon(Icons.arrow_back),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  isSearchMode.value = false;
                  onClear();
                },
              )
            : Transform.translate(
                key: const ValueKey('logo'),
                offset: const Offset(-4, 0),
                child: AppIcon(size: 40),
              ),
      ),
      title: isSearchMode.value
          ? Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: TextField(
                controller: controller,
                focusNode: focusNode,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: context.l10n.search,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
                  isDense: true,
                  suffixIcon: searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, size: 20),
                          onPressed: () {
                            controller.clear();
                            onClear();
                            isSearchMode.value = false;
                          },
                        )
                      : null,
                ),
                onChanged: onSearchChanged,
              ),
            )
          : AnimatedOpacity(
              duration: const Duration(milliseconds: 250),
              opacity: 1.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  AppConstants.appName,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ),
      actions: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: Tween<double>(begin: 0.8, end: 1.0).animate(animation),
                child: child,
              ),
            );
          },
          child: isSearchMode.value
              ? const SizedBox.shrink(key: ValueKey('empty'))
              : IconButton(
                  key: const ValueKey('search_icon'),
                  icon: const Icon(Icons.search),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    isSearchMode.value = true;
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      focusNode.requestFocus();
                    });
                  },
                ),
        ),
      ],
    );
  }
}
