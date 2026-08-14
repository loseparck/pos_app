class OrderSummaryData {
  final int quantity;

  final double subtotal;

  final double vat;

  final double total;

  const OrderSummaryData({
    required this.quantity,
    required this.subtotal,
    required this.vat,
    required this.total,
  });
}