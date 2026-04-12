import 'package:json_annotation/json_annotation.dart';

part 'option_item.g.dart';

@JsonSerializable()
class OptionItem {
  final String id;
  final String name;
  final double price;
  final double vat;
  final bool enabled;
  final String groupId;

  OptionItem({
    required this.name,
    required this.groupId,
    this.id = "",
    this.price = 0,
    this.vat = 0,
    this.enabled = true
  });

   OptionItem copyWith({
    String? id,
    String? name,
    double? price,
    double? vat,
    bool? enabled,
    String? groupId,
  }) {
    return OptionItem(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      vat: vat ?? this.vat,
      enabled: enabled ?? this.enabled,
      groupId: groupId ?? this.groupId
    );
  }

  @override
  String toString() {
    return toJson().toString();
  }

   factory OptionItem.fromJson(Map<String, dynamic> json)
      => _$OptionItemFromJson(json);

  Map<String, dynamic> toJson() => _$OptionItemToJson(this);
}