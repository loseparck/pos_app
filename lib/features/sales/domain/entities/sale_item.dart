class SaleItem {
  final String productId;
  final String productName;
  final int quantity;
  final double unitPrice;

  SaleItem({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.unitPrice,
  });

  double get subtotal => quantity * unitPrice;
}