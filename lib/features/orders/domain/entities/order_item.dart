import 'package:pos_app/features/catalog/domain/entities/option_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_item.g.dart';

@JsonSerializable()
class OrderItem {
  final String productId;
  final String name;
  int quantity;
  final double unitPrice;
  final List<OptionItem>? options;

  OrderItem({
    required this.productId,
    required this.name,
    required this.quantity,
    required this.unitPrice,
    this.options,
  });

  double get subtotal{
    final options = this.options;
    if(options != null) {
      return options.fold(0, (sum , item) => sum + item.price);
    } else {
      return 0;
    }
  } 

  double get supplementsTotal =>
      options!.fold(0, (sum, s) => sum + s.price);

  double get total => (unitPrice + supplementsTotal) * quantity;

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

  @override
  String toString() {
    return toJson().toString();
  }

  factory OrderItem.fromJson(Map<String, dynamic> json)
      => _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}