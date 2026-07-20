import 'package:pos_app/features/catalog/domain/entities/discount.dart';
import 'package:pos_app/features/catalog/domain/entities/item.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';
import 'package:pos_app/features/catalog/domain/entities/category.dart';
import 'package:pos_app/features/catalog/domain/entities/option.dart';

class ProductState{
  final List<Product> products;
  final List<Category> categories;
  final List<Discount> discounts;
  final List<Item> items;
  final List<Option> options;

  final String? selectedProductId;
  final String? selectedCategoryId;
  final String? selectedOptionId;
  final String? selectedOptionGroupId;
  final String? selectedDiscountId;

  ProductState({
    required this.products,
    required this.categories,
    required this.options,
    required this.items,
    required this.discounts,
    this.selectedCategoryId,
    this.selectedProductId,
    this.selectedOptionGroupId,
    this.selectedOptionId,
    this.selectedDiscountId,
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

  Discount? get selectedDiscount {
    if(selectedDiscountId == null) return null;
    try{
      return discounts.firstWhere((discount) => discount.id == selectedDiscountId);
    } catch(_){
      return null;
    }
  } 

  ProductState copyWith({
    List<Product>? products,
    List<Category>? categories,
    List<Item>? items,
    List<Option>? options,
    List<Discount>? discounts,
    String? selectedProductId,
    String? selectedCategoryId,
    String? selectedOptionId,
    String? selectedOptionGroupId,
    String? selectedDiscountId,
    bool? resetProductId,
    bool? resetCategoryId,
    bool? resetOptionId,
    bool? resetOptionGroupId,
    bool? resetDiscountId,
  }){
    return ProductState(
      products: products ?? this.products,
      categories: categories ?? this.categories,
      options: options ?? this.options,
      items: items ?? this.items,
      discounts: discounts ?? this.discounts,
      selectedProductId: resetProductId == true ? null : selectedProductId ?? this.selectedProductId,
      selectedCategoryId: resetCategoryId == true ? null : selectedCategoryId ?? this.selectedCategoryId,
      selectedOptionId: resetOptionId == true ? null : selectedOptionId ?? this.selectedOptionId,
      selectedOptionGroupId: resetOptionGroupId == true ? null : selectedOptionGroupId ?? this.selectedOptionGroupId,
      selectedDiscountId: resetDiscountId == true ? null : selectedDiscountId ?? this.selectedDiscountId
    );
  }
}