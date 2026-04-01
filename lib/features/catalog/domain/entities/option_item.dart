import 'package:json_annotation/json_annotation.dart';

part 'option_item.g.dart';

@JsonSerializable()
class OptionItem {
  final String id;
  final String name;
  final double price;
  final double vat;

  OptionItem({
    required this.name,
    this.price = 0,
    this.vat = 0,
    required this.id
  });

  @override
  String toString() {
    return toJson().toString();
  }

   factory OptionItem.fromJson(Map<String, dynamic> json)
      => _$OptionItemFromJson(json);

  Map<String, dynamic> toJson() => _$OptionItemToJson(this);
}