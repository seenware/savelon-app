class OrganizeSelectionController {
  final Map<String, Set<String>> _selectedByGroup = {};

  Set<String> selectedIdsForGroup(
    String groupId, {
    required Iterable<String> fallbackContactIds,
  }) {
    return _selectedByGroup[groupId] ?? fallbackContactIds.toSet();
  }

  void toggle({
    required String groupId,
    required String contactId,
    required Set<String> currentSelection,
  }) {
    final mutable = Set<String>.from(currentSelection);
    if (mutable.contains(contactId)) {
      mutable.remove(contactId);
    } else {
      mutable.add(contactId);
    }
    _selectedByGroup[groupId] = mutable;
  }
}
