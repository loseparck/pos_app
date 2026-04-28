import 'package:pos_app/features/catalog/domain/entities/option_item.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';
import 'package:pos_app/features/catalog/domain/entities/product_group.dart';
import 'package:pos_app/features/catalog/domain/entities/product_option.dart';

class ProductState{
  final List<Product> products;
  final List<ProductGroup> productGroups;
  final List<OptionItem> items;
  final List<ProductOption> options;

  final String? selectedProductId;
  final String? selectedProductGroupId;
  final String? selectedOptionId;
  final String? selectedOptionGroupId;

  ProductState({
    required this.products,
    required this.productGroups,
    required this.options,
    required this.items,
    this.selectedProductGroupId,
    this.selectedProductId,
    this.selectedOptionGroupId,
    this.selectedOptionId,
  });

  Product? get selectedProduct {
    if(selectedProductId == null) return null;
    try{
      return products.firstWhere((product) => product.id == selectedProductId);
    } catch(_){
      return null;
    }
  } 

  ProductGroup? get selectedProductGroup {
    if(selectedProductGroupId == null) return null;
    try{
      return productGroups.firstWhere((productGroup) => productGroup.id == selectedProductGroupId);
    } catch(_){
      return null;
    }
  } 

  OptionItem? get selectedOption {
    if(selectedOptionId == null) return null;
    try{
      return items.firstWhere((option) => option.id == selectedOptionId);
    } catch(_){
      return null;
    }
  } 

  ProductOption? get selectedOptionGroup {
    if(selectedOptionGroupId == null) return null;
    try{
      return options.firstWhere((optionGroup) => optionGroup.id == selectedOptionGroupId);
    } catch(_){
      return null;
    }
  } 

  ProductState copyWith({
    List<Product>? products,
    List<ProductGroup>? productGroups,
    List<OptionItem>? items,
    List<ProductOption>? options,
    String? selectedProductId,
    String? selectedProductGroupId,
    String? selectedOptionId,
    String? selectedOptionGroupId,
  }){
    return ProductState(
      products: products ?? this.products,
      productGroups: productGroups ?? this.productGroups,
      options: options ?? this.options,
      items: items ?? this.items,
      selectedProductId: selectedProductId ?? this.selectedProductId,
      selectedProductGroupId: selectedProductGroupId ?? this.selectedProductGroupId,
      selectedOptionId: selectedOptionId ?? this.selectedOptionId,
      selectedOptionGroupId: selectedOptionGroupId ?? this.selectedOptionGroupId
    );
  }
}