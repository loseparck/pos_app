import 'package:intl/intl.dart';

class CurrencyFormatter {
  CurrencyFormatter._();

  static final NumberFormat _formatter = NumberFormat.currency(
    locale: "fr_FR",
    symbol: "€",
    decimalDigits: 2,
  );

  static String format(num value) {
    return _formatter.format(value);
  }
}