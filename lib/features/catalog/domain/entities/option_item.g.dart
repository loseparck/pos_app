// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OptionItem _$OptionItemFromJson(Map<String, dynamic> json) => OptionItem(
      name: json['name'] as String,
      price: (json['price'] as num?)?.toDouble() ?? 0,
      id: json['id'] as String,
      groupId: json['groupId'] as String,
    );

Map<String, dynamic> _$OptionItemToJson(OptionItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'groupId': instance.groupId,
    };
