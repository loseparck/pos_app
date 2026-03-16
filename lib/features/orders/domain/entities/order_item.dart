class OrderItem {
  final String productId;
  final String name;
  final int quantity;
  final double unitPrice;
  final List<String>? options;

  OrderItem({
    required this.productId,
    required this.name,
    required this.quantity,
    required this.unitPrice,
    this.options,
  });

  double get subtotal => quantity * unitPrice;

  double get total => unitPrice * quantity;

  OrderItem copyWith({
    int? quantity,
  }) {
    return OrderItem(
      productId: productId,
      name: name,
      unitPrice: unitPrice,
      quantity: quantity ?? this.quantity,
      options: options,
    );
  }
}