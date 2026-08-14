import '../utils/currency_formatter.dart';

extension DoubleExtension on num {
  String get currency {
    return CurrencyFormatter.format(this);
  }
}