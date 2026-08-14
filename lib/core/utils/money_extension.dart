extension MoneyExtension on double {
  String get money => "${toStringAsFixed(2)} DH";
}

extension IntExtension on int {
  String get quantityLabel => "x$this";

  String get label => toString();

   String get articles => "$this article${this > 1 ? 's' : ''}";
}