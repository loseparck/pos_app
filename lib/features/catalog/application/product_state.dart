import 'package:pos_app/features/catalog/domain/entities/discount.dart';
import 'package:pos_app/features/catalog/domain/entities/item.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';
import 'package:pos_app/features/catalog/domain/entities/category.dart';
import 'package:pos_app/features/catalog/domain/entities/option.dart';

class ProductState{
  final List<Product> products;
  final List<Category> categories;
  final List<Discount> dicounts;
  final List<Item> items;
  final List<Option> options;

  final String? selectedProductId;
  final String? selectedCategoryId;
  final String? selectedOptionId;
  final String? selectedOptionGroupId;

  ProductState({
    required this.products,
    required this.categories,
    required this.options,
    required this.items,
    required this.dicounts,
    this.selectedCategoryId,
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

  Category? get selectedCategory {
    if(selectedCategoryId == null) return null;
    try{
      return categories.firstWhere((category) => category.id == selectedCategoryId);
    } catch(_){
      return null;
    }
  } 

  Item? get selectedOption {
    if(selectedOptionId == null) return null;
    try{
      return items.firstWhere((option) => option.id == selectedOptionId);
    } catch(_){
      return null;
    }
  } 

  Option? get selectedOptionGroup {
    if(selectedOptionGroupId == null) return null;
    try{
      return options.firstWhere((optionGroup) => optionGroup.id == selectedOptionGroupId);
    } catch(_){
      return null;
    }
  } 

  ProductState copyWith({
    List<Product>? products,
    List<Category>? categories,
    List<Item>? items,
    List<Option>? options,
    List<Discount>? dicounts,
    String? selectedProductId,
    String? selectedCategoryId,
    String? selectedOptionId,
    String? selectedOptionGroupId,
    bool? resetProductId,
    bool? resetCategoryId,
    bool? resetOptionId,
    bool? resetOptionGroupId,
  }){
    return ProductState(
      products: products ?? this.products,
      categories: categories ?? this.categories,
      options: options ?? this.options,
      items: items ?? this.items,
      dicounts: dicounts ?? this.dicounts,
      selectedProductId: resetProductId == true ? null : selectedProductId ?? this.selectedProductId,
      selectedCategoryId: resetCategoryId == true ? null : selectedCategoryId ?? this.selectedCategoryId,
      selectedOptionId: resetOptionId == true ? null : selectedOptionId ?? this.selectedOptionId,
      selectedOptionGroupId: resetOptionGroupId == true ? null : selectedOptionGroupId ?? this.selectedOptionGroupId
    );
  }
}