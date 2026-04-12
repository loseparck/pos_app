import 'package:flutter_riverpod/legacy.dart';
import 'package:pos_app/features/catalog/application/product_state.dart';
import 'package:pos_app/features/catalog/domain/entities/option_item.dart';
import 'package:pos_app/features/catalog/domain/entities/product_group.dart';
import 'package:pos_app/features/catalog/domain/entities/product_option.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';
import 'package:uuid/uuid.dart';

final productsProvider =
    StateNotifierProvider<ProductNotiier, ProductState?>(
        (ref) => ProductNotiier());

class ProductNotiier extends StateNotifier<ProductState> {
  
  final _uuid = const Uuid();

  ProductNotiier() : 
    super(
      ProductState(
        products: [], 
        productGroups: [], 
        options: [], 
        optionGroups: []
      )
    );

  void changeSelectedOption(String optionId){
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
  }

  void addOption(OptionItem option){
    if(option.id == ""){
      //TODO send TO API for SAVE
      option = option.copyWith(
        id: _uuid.v4(),
      );
    }
    state = state.copyWith(
      options: [...state.options, option]
    );
  }

  void addOptionGroup(ProductOption optionGroup){
    if(optionGroup.id == ""){
      //TODO send TO API for SAVE
      optionGroup = optionGroup.copyWith(
        id: _uuid.v4(),
      );
    }
    state = state.copyWith(
      optionGroups: [...state.optionGroups, optionGroup]
    );
  }



}