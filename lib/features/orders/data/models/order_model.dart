import 'package:pos_app/features/orders/data/models/order_item_model.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';

class OrderModel extends Order{
  OrderModel({
    required super.id,
    required super.items,
    required super.createdAt,
    required super.synced,
  });
  factory OrderModel.fromJson(Map<String, dynamic> json){
    return OrderModel(
      id: json['id'], 
      items:  (json['items'] as List)
        .map((e) => OrderItemModel.fromJson(e))
        .toList(), 
      createdAt:  DateTime.parse(json['createdAt']), 
      synced:  json['synced']);
  }

  Map<String, dynamic> toJson(){
    return {
      "id": id, 
      "items": items.map((e) => (e as OrderItemModel).toJson()).toList(), 
      "createdAt": createdAt.toIso8601String(),
      "synced": synced,
    };
  }
}