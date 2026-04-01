import 'package:pos_app/features/orders/domain/entities/order_item.dart';

class OrderItemModel extends OrderItem{
  OrderItemModel({
      required super.id,
      required super.productId,
      required super.name,
      required super.quantity,
      required super.unitPrice,
      required super.createdAt,
    });

  factory OrderItemModel.fromJson(Map<String, dynamic> json){
    return OrderItemModel(
      id: json['id'], 
      productId: json['productId'], 
      name:  json['name'], 
      quantity:  json['quantity'], 
      unitPrice:  json['unitPrice'],
      createdAt:  json['createdAt'],
    );
  }

}