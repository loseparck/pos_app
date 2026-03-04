import 'package:pos_app/features/sales/data/models/sale_item_model.dart';
import 'package:pos_app/features/sales/domain/entities/sale.dart';

class SaleModel extends Sale{
  SaleModel({
    required super.id,
    required super.items,
    required super.createdAt,
    required super.synced,
  });
  factory SaleModel.fromJson(Map<String, dynamic> json){
    return SaleModel(
      id: json['id'], 
      items:  (json['items'] as List)
        .map((e) => SaleItemModel.fromJson(e))
        .toList(), 
      createdAt:  DateTime.parse(json['createdAt']), 
      synced:  json['synced']);
  }

  Map<String, dynamic> toJson(){
    return {
      "id": id, 
      "items":  items.map((e) => (e as SaleItemModel).toJson()).toList(), 
      "createdAt":  createdAt.toIso8601String(),
      "synced":  synced,
    };
  }
}