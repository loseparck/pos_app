import 'package:pos_app/features/sales/domain/entities/sale_item.dart';

class SaleItemModel extends SaleItem{
  SaleItemModel({
      required super.productId,
      required super.productName,
      required super.quantity,
      required super.unitPrice,
    });

  factory SaleItemModel.fromJson(Map<String, dynamic> json){
    return SaleItemModel(
      productId: json['productId'], 
      productName:  json['productName'], 
      quantity:  json['quantity'], 
      unitPrice:  json['unitPrice'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "productId": productId, 
      "productName":  productName, 
      "quantity":  quantity, 
      "unitPrice":  unitPrice,
    };
  }
}