import 'package:pos_app/features/orders/domain/entities/order_item.dart';

class OrderItemModel extends OrderItem{
  OrderItemModel({
      required super.productId,
      required super.name,
      required super.quantity,
      required super.unitPrice,
    });

  factory OrderItemModel.fromJson(Map<String, dynamic> json){
    return OrderItemModel(
      productId: json['productId'], 
      name:  json['name'], 
      quantity:  json['quantity'], 
      unitPrice:  json['unitPrice'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "productId": productId, 
      "name":  name, 
      "quantity":  quantity, 
      "unitPrice":  unitPrice,
    };
  }
}