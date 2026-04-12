import 'package:pos_app/features/catalog/domain/entities/option_item.dart';

class ProductOption {
  final String id;
  final String name;
  final bool isMandatory;
  final int minToSelect;
  final int maxToSelect;
  final bool multipleSelect;
  final bool enabled;
  final List<OptionItem> items;

  ProductOption({
    required this.name,
    required this.items,
    this.isMandatory = false,
    this.minToSelect = 0,
    this.maxToSelect = -1,
    this.multipleSelect = false,
    this.id = "",
    this.enabled = true,
  });

   ProductOption copyWith({
    String? id,
    String? name,
    bool? isMandatory,
    int? minToSelect,
    int? maxToSelect,
    bool? multipleSelect,
    bool? enabled,
    List<OptionItem>? items
  }) {
    return ProductOption(
      id: id ?? this.id,
      name: name ?? this.name,
      isMandatory: isMandatory ?? this.isMandatory,
      minToSelect: minToSelect ?? this.minToSelect,
      maxToSelect: maxToSelect ?? this.maxToSelect,
      multipleSelect: multipleSelect ?? this.multipleSelect,
      enabled: enabled ?? this.enabled,
      items: items ?? this.items
    );
  }
}