import 'package:contacts/l10n/l10n_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class WideContactsAppBar extends HookWidget implements PreferredSizeWidget {
  final String searchQuery;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onClear;

  const WideContactsAppBar({
    super.key,
    required this.searchQuery,
    required this.onSearchChanged,
    required this.onClear,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: searchQuery);

    useEffect(() {
      if (searchQuery.isEmpty && controller.text.isNotEmpty) {
        controller.clear();
      }
      return null;
    }, [searchQuery]);

    return TextField(
      controller: controller,
      onChanged: onSearchChanged,
      decoration: InputDecoration(
        hintText: context.l10n.search,
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 16, top: 1, right: 8),
          child: Icon(Icons.search, size: 24),
        ),
        suffixIcon: searchQuery.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton(
                  icon: const Icon(Icons.clear, size: 20),
                  onPressed: () {
                    controller.clear();
                    onClear();
                  },
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(40),
        ),
        filled: true,
      ),
    );
  }
}
