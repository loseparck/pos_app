import 'package:pos_app/core/network/connectivity_service.dart';
import 'package:pos_app/features/catalog/data/datasources/product_local_datasource.dart';
import 'package:pos_app/features/catalog/data/datasources/product_remote_datasource.dart';
import 'package:pos_app/features/catalog/data/mappers/catalog_mappers.dart';
import 'package:pos_app/features/catalog/data/repositories/product_repository.dart';
import 'package:pos_app/features/catalog/domain/entities/category.dart';
import 'package:pos_app/features/catalog/domain/entities/item.dart';
import 'package:pos_app/features/catalog/domain/entities/option.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';
import 'package:uuid/uuid.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._connectivity
  );

  final ProductRemoteDataSource _remoteDataSource;
  final ProductLocalDataSource _localDataSource;
  final ConnectivityService _connectivity;

  final _uuid = const Uuid();

  @override
  Future<Option> saveOption(Option option) async {
    option = option.copyWith(
      id: _uuid.v4(),
      items: option.items.map((item) {
        if(item.id.isEmpty) {
          item = item.copyWith(id: _uuid.v4());
        }
        return item;
      }).toList()
    );
    
    if(!kIsWeb) {
      await _localDataSource.saveOption(option);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.saveOption(option.toCreateDto());
    }else if(!kIsWeb){
      //TODO QUEUE
    }

    return option;
  }
 
  @override
  Future<Item> saveItem(Item item) async {
    item = item.copyWith(
      id: _uuid.v4(),
    );

    if(!kIsWeb) {
      await _localDataSource.saveItem(item);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.saveItem(item.toCreateDto());
    }
    else if(!kIsWeb){
      //TODO QUEUE
    }

    return item;
  }

  @override
  Future<List<Item>> getItems() async {
    late final  List<Item> items;
    if(!kIsWeb) {
      items = await _localDataSource.getItems();
      if(items.isNotEmpty){
        return items;
      }
    } 
    
    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.getItems();
    }
    
    return items;
  }

  @override
  Future<Item?> getItem(String id) async {
    if(!kIsWeb) {
      final item = await _localDataSource.getItem(id);
      if(item != null){
        return item.toEntity(Option(name: '', items: [], id: item.optionId));
      }
    } 

    if(await _connectivity.isOnline()) {
      return _remoteDataSource.getItem(id);
    }

    return null;
  }

  @override
  Future<List<Item>> getItemByOptionId(String optionId) async {
    final  List<Item> items = [];
    if(!kIsWeb) {
      items.addAll(await _localDataSource.getItemByOptionId(optionId));
      if(items.isNotEmpty){
        return items;
      }
    } 
    
    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.getItemByOptionId(optionId);
    }

    return items;
  }

  @override
  Future<Option?> getOption(String id) async {
    if(!kIsWeb) {
      final option = await _localDataSource.getOption(id);
      if(option != null){
        return option.toEntity();
      }
    } 
    
    if(await _connectivity.isOnline()) {
      return _remoteDataSource.getOption(id);
    }

    return null;
  }

  @override
  Future<List<Option>> getOptions() async {
    final  List<Option> options = [];
    if(!kIsWeb) {
      options.addAll(await _localDataSource.getOptions());
      if(options.isNotEmpty){
        return options;
      }
    } 
    
    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.getOptions();
    }

    return options;
  }
  
  @override
  Future<void> removeOption(String optionId) async {
    if(!kIsWeb) {
      await _localDataSource.removeOption(optionId);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.removeOption(optionId);
    }
    else if(!kIsWeb) {
      //TODO add to QUEUE
    }
  }
  
  @override
  Future<void> removeItem(String itemId) async {
    if(!kIsWeb) {
      await _localDataSource.removeItem(itemId);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.removeItem(itemId);
    }
    else if(!kIsWeb) {
      //TODO add to QUEUE
    }
  }
  
  @override
  Future<Item> updateItem(Item item) async {
    if(!kIsWeb) {
      await _localDataSource.updateItem(item);
    }
     
    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.updateItem(item.toUpdateDto(), item.id);
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }
    
    return item;
  }
  
  @override
  Future<Option> updateOption(Option option) async {
    if(!kIsWeb) {
      _localDataSource.updateOption(option);
    }

    if(await _connectivity.isOnline()) {
      return _remoteDataSource.updateOption(option.toUpdateDto(), option.id);
    }
    else if(!kIsWeb) {
      //TODO add to QUEUE
    }
    return option;
  }
  
  @override
  Future<void> removeItems(List<String> itemsId) async {
    if(!kIsWeb) {
      await _localDataSource.removeItems(itemsId);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.removeItems(itemsId);
    }else if(!kIsWeb) {
      //TODO add to QUEUE
    }
  }

  @override
  Future<List<Category>> getCategories() async {
    final List<Category> categories = [];
    if(!kIsWeb) {
      categories.addAll(await _localDataSource.getCategories());
      if(categories.isNotEmpty){
        return categories;
      }
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.getCategories();
    }

    return categories;
  }

  @override
  Future<Category?> getCategory(String id) async {
    late final Category? category;
    if(!kIsWeb) {
      category = await _localDataSource.getCategory(id);
      if(category != null){
        return category;
      }
    } 
    
    if(await _connectivity.isOnline()) {
      return _remoteDataSource.getCategory(id);
    }

    return category;
  }

  @override
  Future<Product?> getProduct(String id) async {
    late final Product? product;
    if(!kIsWeb) {
      product = await _localDataSource.getProduct(id);
      if(product != null){
        return product;
      }
    } 
    
    if(await _connectivity.isOnline()) {
      return _remoteDataSource.getProduct(id);
    }

    return product;
  }

  @override
  Future<List<Product>> getProducts() async {
    final List<Product> products = [];
    if(!kIsWeb) {
      products.addAll(await _localDataSource.getProducts());
      if(products.isNotEmpty){
        return products;
      }
    }

    if(await _connectivity.isOnline()) {
      return _remoteDataSource.getProducts();
    }

    return products;
  }

  @override
  Future<List<Product>> getProductsByCategory(String categoryId) async {
    // TODO: implement getProductsByCategory
    throw UnimplementedError();
  }

  @override
  Future<void> removeCategory(String id) async {
    if(!kIsWeb) {
      await _localDataSource.removeCategory(id);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.removeCategory(id);
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }
  }

  @override
  Future<void> removeCategoryWithChildren(String id) async {
    if(!kIsWeb) {
      await _localDataSource.removeCategoryWithChildren(id);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.removeCategoryWithChildren(id);
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }
  }

  @override
  Future<void> removeProduct(String id) async {
    if(!kIsWeb) {
      await _localDataSource.removeProduct(id);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.removeProduct(id);
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }
  }

  @override
  Future<void> removeProducts(List<String> ids) async {
     if(!kIsWeb) {
      await _localDataSource.removeProducts(ids);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.removeProducts(ids);
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }
  }

  @override
  Future<Category> saveCategory(Category category) async {
    category = category.copyWith(
      id: _uuid.v4(),
    );

    if(!kIsWeb) {
      await _localDataSource.saveCategory(category);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.saveCategory(category.toCreateDto());
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }

    return category;
  }

  @override
  Future<Product> saveProduct(Product product) async {
    product = product.copyWith(
      id: _uuid.v4(),
    );

    if(!kIsWeb) {
      await _localDataSource.saveProduct(product);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.saveProduct(product.toCreateDto());
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }

    return product;
  }

  @override
  Future<Category> updateCategory(Category category) async {
    if(!kIsWeb) {
      _localDataSource.updateCategory(category);
    } 
    
    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.updateCategory(category.toUpdateDto(), category.id);
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }

    return category;
  }

  @override
  Future<Product> updateProduct(Product product) async {
    if(!kIsWeb) {
      _localDataSource.updateProduct(product);
    } 
    
    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.updateProduct(product.toUpdateDto(), product.id);
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }

    return product;
  }

}