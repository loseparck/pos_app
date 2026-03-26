import 'package:pos_app/features/catalog/domain/entities/option_item.dart';

class ProductOption {
  final String id;
  final String name;
  final bool isMandatory;
  final int minToSelect;
  final int maxToSelect;
  final bool multipleSelect;
  final List<OptionItem> options;

  ProductOption({
    required this.name,
    required this.options,
    this.isMandatory = false,
    this.minToSelect = 0,
    this.maxToSelect = 0,
    this.multipleSelect = false,
    required this.id,
  });

  
}