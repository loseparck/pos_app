import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/catalog/application/product_state.dart';
//import 'package:pos_app/features/catalog/data/product_repository.dart';
import 'package:pos_app/features/catalog/domain/entities/option_item.dart';
import 'package:pos_app/features/catalog/domain/entities/product_option.dart';
import 'package:pos_app/features/catalog/data/repositories/product_repository.dart';
import 'usecase_provider.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  final Ref ref;
  final ProductRepository _repository;

  ProductNotifier(this.ref, this._repository) : 
    super(
      ProductState(
        products: [], 
        productGroups: [], 
        options:  [], 
        items:  []
      )
    ){
      load();
    }

  Future<void> load() async {
    final items = await _repository.getItems();
    final options = await _repository.getOptions();
    state = state.copyWith(
      items: items,
      options: options
    );
  } 

  List<OptionItem> getItemByOption(String groupId){
    return state.items.where((item) => item.groupId == groupId).toList();
  }

  ProductOption getOption(String optionId){
    return state.options.where((option) => option.id == optionId).first;
  }

  Future<bool> addItem(OptionItem item) async {
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

  Future<bool> addOption(ProductOption optionGroup) async {
    try {
      final saveOptionUseCase = ref.read(saveOptionUseCaseProvider);
      final newOptionGroup = await saveOptionUseCase(optionGroup);
      state = state.copyWith(
        options: [...state.options, newOptionGroup],
        items: [...state.items, ...newOptionGroup.items.map((o) => o.copyWith(groupId: newOptionGroup.id))],
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
        items: state.items.where((item) => item.groupId != id).toList(),
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

  void updateOption(ProductOption option) async {
      final updateOptionUseCase = ref.read(updateOptionUseCaseProvider);
      updateOptionUseCase(option);
      state = state.copyWith(
        options: state.options.map((elem) => elem.id != option.id ? elem : option).toList(),
      );
  }

  void updateItem(OptionItem item) async {
      final updateItemUseCase = ref.read(updateItemUseCaseProvider);
      updateItemUseCase(item);
       
      state = state.copyWith(
        items: state.items.map((elem) => elem.id != item.id ? elem: item).toList(),
      );
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