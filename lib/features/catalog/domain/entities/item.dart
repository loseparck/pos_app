import 'package:json_annotation/json_annotation.dart';
import 'package:pos_app/features/catalog/domain/entities/option.dart';


@JsonSerializable()
class Item {
  final String id;
  final String name;
  final double price;
  final double vat;
  final bool isActive;
  final Option option;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String? createdById;

  Item({
    required this.name,
    required this.option,
    this.id = "",
    this.price = 0,
    this.vat = 0,
    this.isActive = true,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdById,
  });

   Item copyWith({
    String? id,
    String? name,
    double? price,
    double? vat,
    bool? isActive,
    Option? option,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    String? createdById
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      vat: vat ?? this.vat,
      isActive: isActive ?? this.isActive,
      option: option ?? this.option,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      createdById: createdById ?? this.createdById
    );
  }

  @override
  String toString() {
    return toJson().toString();
  }

  factory Item.fromJson(Map<String, dynamic> json){
    return Item(
      id: json['id'] as String,
      name: json['name'] as String,
      option: Option(id:json['optionId'] ?? '', name: '', items: []),
      price: double.tryParse(json['price'].toString()) ?? 0,
      vat: double.tryParse(json['vat'].toString()) ?? 0,
      isActive: (json['isActive'] as bool),
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      deletedAt: json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
      createdById: json['createdById'] as String?,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': name,
      'price': price,
      'vat': vat,
      'isActive': isActive,
      'option': option.toJson(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'createdById': createdById,
    };
  }
}