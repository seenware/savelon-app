import 'package:contacts/features/main_app/contacts/presentation/contact_form/utils/field_type_l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../controllers/records_controller.dart';

RecordsController useRecords(List<String> types, FieldKind fieldKind) {
  final records = useState<List<Record>>([]);
  final listKey = useMemoized(() => GlobalKey<AnimatedListState>());

  final controller = useMemoized(
    () => RecordsController(
      records: records,
      listKey: listKey,
      types: types,
      fieldKind: fieldKind,
    ),
    [types.join(','), fieldKind],
  );

  useEffect(() {
    return controller.dispose;
  }, [controller]);

  return controller;
}
