import 'dart:convert';

import 'package:drift/drift.dart';

class PaymentConverter
    extends TypeConverter<Map<String, int>, String> {
  const PaymentConverter();

  @override
  Map<String, int> fromSql(String fromDb) {
    return Map<String, int>.from(
      jsonDecode(fromDb) as Map<String, dynamic>,
    );
  }

  @override
  String toSql(Map<String, int> value) {
    return jsonEncode(value);
  }
}