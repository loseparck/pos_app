import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/catalog/application/product_state.dart';
import 'package:pos_app/features/catalog/domain/entities/discount.dart';
import 'package:pos_app/features/catalog/domain/entities/item.dart';
import 'package:pos_app/features/catalog/domain/entities/option.dart';
import 'package:pos_app/features/catalog/data/repositories/product_repository.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';
import 'package:pos_app/features/catalog/domain/entities/category.dart';
import 'usecase_provider.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  final Ref ref;
  final ProductRepository _repository;

  ProductNotifier(this.ref, this._repository) : 
    super(
      ProductState(
        products: [], 
        categories: [], 
        options: [], 
        items: [],
        discounts: []
      )
    );

  Future<void> load() async {
    final items = await _repository.getItems();
    final options = await _repository.getOptions();
    final categories = await _repository.getCategories();
    final products = await _repository.getProducts();
    final discounts = await _repository.getDiscounts();
    state = state.copyWith(
      categories: categories,
      products: products,
      items: items,
      options: options,
      discounts: discounts
    );
    for(Product p in products){
        print("image: ${p.image}");
    }
    
  } 

  List<Item> getItemByOption(String groupId){
    return state.items.where((item) => item.option.id == groupId).toList();
  }

  Option getOption(String optionId){
    return state.options.where((option) => option.id == optionId).first;
  }

  Future<bool> addItem(Item item) async {
    try {
      final saveItemUseCase = ref.read(saveItemUseCaseProvider);
      final newItemGroup = await saveItemUseCase(item);
      state = state.copyWith(
        items: [...state.items, newItemGroup],
      );
      return true;
    } catch (e) {
      if (kDebugMode) {
        print("Error ${e.toString()}");
      }
      return false;
    }
  }

  Future<bool> addOption(Option optionGroup) async {
    try {
      final saveOptionUseCase = ref.read(saveOptionUseCaseProvider);
      final newOption = await saveOptionUseCase(optionGroup);
      state = state.copyWith(
        options: [...state.options, newOption],
        items: [...state.items, ...newOption.items.map((o) => o.copyWith(option: newOption))],
      );
      return true;
    } catch (e) {
      if (kDebugMode) {
        print("Error ${e.toString()}");
      }
      return false;
    }
  }

  void removeOption(String id) async {
      final removeOptionUseCase = ref.read(removeOptionUseCaseProvider);
      removeOptionUseCase(id);
      state = state.copyWith(
        options: state.options.where((item) => item.id != id).toList(),
        items: state.items.where((item) => item.option.id != id).toList(),
      );
  }

  void removeItem(String id) async {
      final removeItemUseCase = ref.read(removeItemUseCaseProvider);
      removeItemUseCase(id);
      state = state.copyWith(
        items: state.items.where((item) => item.id != id).toList(),
      );
  }

  void removeItems(List<String> ids) async {
      final removeItemsUseCase = ref.read(removeItemsUseCaseProvider);
      removeItemsUseCase(ids);
      state = state.copyWith(
        items: state.items.where((item) => !ids.contains(item.id)).toList(),
      );
  }

  void updateOption(Option option) async {
      final updateOptionUseCase = ref.read(updateOptionUseCaseProvider);
      updateOptionUseCase(option);
      state = state.copyWith(
        options: state.options.map((elem) => elem.id != option.id ? elem : option).toList(),
      );
  }

  void updateItem(Item item) async {
      final updateItemUseCase = ref.read(updateItemUseCaseProvider);
      updateItemUseCase(item);
       
      state = state.copyWith(
        items: state.items.map((elem) => elem.id != item.id ? elem: item).toList(),
      );
  }

  Future<bool> addCategory(Category category, String? picturePath) async {
    try {
      final saveCategoryUseCase = ref.read(saveCategoryUseCaseProvider);
      final newCategory = await saveCategoryUseCase(category, picturePath);
      state = state.copyWith(
        categories: [...state.categories, newCategory],
      );
      return true;
    } catch (e) {
      if (kDebugMode) {
        print("Error ${e.toString()}");
      }
      return false;
    }
  }

  Future<Discount?> addDiscount(Discount discount) async {
    try {
      final saveDiscountUseCase = ref.read(saveDiscountUseCaseProvider);
      final newDiscount = await saveDiscountUseCase(discount);
      state = state.copyWith(
        discounts: [...state.discounts, newDiscount],
      );
      return newDiscount;
    } catch (e) {
      if (kDebugMode) {
        print("Error ${e.toString()}");
      }
      return null;
    }
  }

  Future<String?> addProduct(Product product, String? picturePath) async {
    try {
      final saveProductUseCase = ref.read(saveProductUseCaseProvider);
      final newProduct = await saveProductUseCase(product, picturePath);
      state = state.copyWith(
        products: [...state.products, newProduct],
      );
      return newProduct.id;
    } catch (e) {
      if (kDebugMode) {
        print("Error ${e.toString()}");
      }
      return null;
    }
  }

  List<Product> getProductsByCategory(String groupId){
    return state.products.where((item) => item.category != null && item.category?.id == groupId).toList();
  }

  Category getCategory(String categoryId){
    return state.categories.where((category) => category.id == categoryId).first;
  }

  Future<List<Category>> getCategoryChild(String parentId) async {
    
    return state.categories.where((category) => category.parent?.id == parentId).toList();
  }

  void updateCategory(Category category) async {
      final updateCategoryUseCase = ref.read(updateCategoryUseCaseProvider);
      updateCategoryUseCase(category);
      state = state.copyWith(
        categories: state.categories.map((elem) => elem.id != category.id ? elem : category).toList(),
      );
  }

  Future<void> updateProduct(Product product) async {
      final updateProductUseCase = ref.read(updateProductUseCaseProvider);
      updateProductUseCase(product);
       
      state = state.copyWith(
        products: state.products.map((elem) => elem.id != product.id ? elem: product).toList(),
      );
  }

  Future<void> updateDiscount(String discountId, bool newState) async {
      final changeDiscountStateUseCase = ref.read(changeDiscountStateUseCaseProvider);
      changeDiscountStateUseCase(discountId, newState);
       
      state = state.copyWith(
        discounts: state.discounts.map((elem) => elem.id != discountId ? elem: elem.copyWith(isActive: newState)).toList(),
      );
  }

  Future<void> removeCategory(String id) async {
      final removeCategoryUseCase = ref.read(removeCategoryUseCaseProvider);
      removeCategoryUseCase(id);
      Category toRemove = getCategory(id);

      state = state.copyWith(
        categories: state.categories.where((item) => item.id != id).map((item) => item.parent?.id != toRemove.id ? item : item.copyWith(parent: toRemove.parent, resetParent: toRemove.parent == null)).toList(),
        products: state.products.map((product) => product.category?.id != toRemove.id ? product : product.copyCategory(category: toRemove.parent)).toList(),
      );

  }

  Future<void> removeCategoryWithChildren(String id) async {
    final removeCategoryWithChilrendUseCase = ref.read(removeCategoryWithChilrendUseCaseProvider);
    removeCategoryWithChilrendUseCase(id);
    state = state.copyWith(
      categories: state.categories.where((item) => item.id != id && item.parentId != id).toList(),
      products: state.products.where((item) => item.category == null || item.category?.id != id).toList(),
    );
  }
  
  Future<void> removeProduct(String id) async {
      final removeProductUseCase = ref.read(removeProductUseCaseProvider);
      removeProductUseCase(id);
      state = state.copyWith(
        products: state.products.where((item) => item.id != id).toList(),
      );
  }

  Future<void> removeProducts(List<String> ids) async {
      final removeProductsUseCase = ref.read(removeProductsUseCaseProvider);
      removeProductsUseCase(ids);
      state = state.copyWith(
        products: state.products.where((item) => !ids.contains(item.id)).toList(),
      );
  }

  Future<void> removeDiscount(String id) async {
      final removeDiscountUseCase = ref.read(removeDiscountUseCaseProvider);
      removeDiscountUseCase(id);
      state = state.copyWith(
        discounts: state.discounts.where((item) => item.id != id).toList(),
      );
  }

  void changeSeletedCategory(String? categoryId){
    if(categoryId == null){
      state = state.copyWith(
        resetCategoryId: true
      );
    }else {
      state = state.copyWith(
        selectedCategoryId: categoryId
      );
    }
  }
  /*void changeSelectedOption(String optionId){
    state = state.copyWith(
      selectedOptionId: optionId
    );
  }

  void changeSelectedOptionGroup(String optionGroupId){
     state = state.copyWith(
      selectedOptionGroupId: optionGroupId
    );   
  }

  void changeSelectedProduct(String productId){
    state = state.copyWith(
      selectedProductId: productId
    );    
  }

  void changeSelectedProductGroup(String productGroupId){
    state = state.copyWith(
      selectedProductGroupId: productGroupId
    );    
  }

  void addProduct(Product product){
    if(product.id == ""){
      //TODO send TO API for SAVE
      product = product.copyWith(
        id: _uuid.v4(),
      );
    }
    state = state.copyWith(
      products: [...state.products, product]
    );
  }

  void addProductGroup(ProductGroup productGroup){
    if(productGroup.id == ""){
      //TODO send TO API for SAVE
      productGroup = productGroup.copyWith(
        id: _uuid.v4(),
      );
    }
    state = state.copyWith(
      productGroups: [...state.productGroups, productGroup]
    );
  }*/
}