import 'package:json_annotation/json_annotation.dart';

enum DiscountType { percentage, fixed }

class Discount {
  final String? id;
  final DiscountType type;
  final double value;
  final List<String>? itemIds;
  
  Discount({
    required this.type,
    required this.value,
    this.itemIds,
    this.id,
  }); 

  Discount copyWith({
    DiscountType? type,
    double? value,
    List<String>? itemIds,
  }) {
    return Discount(
      id: id,
      type: type ?? this.type,
      value: value ?? this.value,
      itemIds: itemIds ?? this.itemIds,
    );
  }

  @override
  String toString() {
    return toJson().toString();
  }

  factory Discount.fromJson(Map<String, dynamic> json){
    return Discount(
      id: json['id'] as String,
      value: (json['value'] as num).toDouble(),
      type: $enumDecodeNullable(_$DiscountTypeEnumMap, json['type']) ??
          DiscountType.fixed,
      itemIds: json['itemIds']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'value': value,
      'type': _$DiscountTypeEnumMap[type],
      'itemIds': itemIds,
    };
  }
}

const _$DiscountTypeEnumMap = {
  DiscountType.fixed: 'fixed',
  DiscountType.percentage: 'percentage',
};