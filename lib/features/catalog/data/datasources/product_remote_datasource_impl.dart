import 'package:dio/dio.dart';
import 'package:pos_app/core/network/api_endpoints.dart';
import 'package:pos_app/features/catalog/data/models/dto/create_category_dto.dart';
import 'package:pos_app/features/catalog/data/models/dto/create_item_dto.dart';
import 'package:pos_app/features/catalog/data/models/dto/create_option_dto.dart';
import 'package:pos_app/features/catalog/data/models/dto/create_product_dto.dart';
import 'package:pos_app/features/catalog/data/models/dto/update_category_dto.dart';
import 'package:pos_app/features/catalog/data/models/dto/update_item_dto.dart';
import 'package:pos_app/features/catalog/data/models/dto/update_option_dto.dart';
import 'package:pos_app/features/catalog/data/models/dto/update_product_dto.dart';
import 'package:pos_app/features/catalog/domain/entities/category.dart';
import 'package:pos_app/features/catalog/domain/entities/item.dart';
import 'package:pos_app/features/catalog/domain/entities/option.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';

import 'product_remote_datasource.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  ProductRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<Option> saveOption(CreateOptionDto option) async {
    final response = await _dio.post(
      ApiEndpoints.options,
      data: option.toJson(),
    );
    
    return Option.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<Item> saveItem(CreateItemDto item) async {
    final response = await _dio.post(
      '${ApiEndpoints.options}/${item.optionId}${ApiEndpoints.items}',
      data: item.toJson(),
    );

    return Item.fromJson(response.data['data'] as Map<String, dynamic>);
    //return item.toEntity(Option(name: "name", items: []));
  }

  @override
  Future<Item> getItem(String itemId) async {
    final response = await _dio.get(
      '${ApiEndpoints.options}${ApiEndpoints.items}/$itemId'
    );

    return Item.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<List<Item>> getItems() async {
    final response = await _dio.get(
      '${ApiEndpoints.options}${ApiEndpoints.items}',
    );
    
    return (response.data['data'] as List<dynamic>).map((e) => Item.fromJson(e)).toList();
  }
  
  @override
  Future<List<Item>> getItemByOptionId(String optionId) async {
    final response = await _dio.get(
       '${ApiEndpoints.options}/$optionId${ApiEndpoints.items}',
    );
    
    return (response.data['data'] as List<dynamic>).map((e) => Item.fromJson(e)).toList();
  }

  @override
  Future<Option> getOption(String id) async {
    final response = await _dio.get(
      '${ApiEndpoints.options}/$id',
    );

    return Option.fromJson(response.data['data'] as Map<String, dynamic>);
  }
 
  @override
  Future<List<Option>> getOptions() async {
    final response = await _dio.get(
      ApiEndpoints.options
    );

    return (response.data['data']['options'] as List<dynamic>).map((e) => Option.fromJson(e)).toList();
  }

  @override
  Future<Option> getOptionWithItems(String id) {
    // TODO: implement getOptionWithItems
    throw UnimplementedError();
  }

  @override
  Future<void> removeItem(String itemId) async {
    final response = await _dio.delete(
       '${ApiEndpoints.options}${ApiEndpoints.items}/$itemId',
    );
    if(response.data['data'] == "0"){
      throw Exception('Item not found');
    }
  }

  @override
  Future<void> removeItems(List<String> ids) async {
    final response = await _dio.delete(
       '${ApiEndpoints.options}${ApiEndpoints.items}',
       data: ids
    );
    if(response.data['data'] == "0"){
      throw Exception('Item not found');
    }
  }

  @override
  Future<void> removeOption(String optionId) async {
    final response = await _dio.delete(
       '${ApiEndpoints.options}/$optionId',
    );
    if(response.data['data'] == "0"){
      throw Exception('Item not found');
    }
  }

 
  @override
  Future<Item> updateItem(UpdateItemDto item, String itemId) async {
   final response = await _dio.patch(
       '${ApiEndpoints.options}${ApiEndpoints.items}/$itemId',
       data: item
    );

    return Item.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<Option> updateOption(UpdateOptionDto option, String optionId) async {
    final response = await _dio.patch(
       '${ApiEndpoints.options}/$optionId',
       data: option
    );

    return Option.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<List<Category>> getCategories() async {
    final response = await _dio.get(
      ApiEndpoints.categories
    );

    return (response.data['data']['categories'] as List<dynamic>).map((e) => Category.fromJson(e)).toList();
  }

  @override
  Future<Category?> getCategory(String id) async {
    final response = await _dio.get(
      '${ApiEndpoints.categories}/$id',
    );

    return Category.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<Product?> getProduct(String id) async {
   final response = await _dio.get(
      '${ApiEndpoints.products}/$id',
    );

    return Product.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<List<Product>> getProducts() async {
    final response = await _dio.get(
      ApiEndpoints.products
    );

    return (response.data['data']['products'] as List<dynamic>).map((e) => Product.fromJson(e)).toList();
  }

  @override
  Future<List<Product>> getProductsByCategory(String categoryId) async {
     final response = await _dio.get(
       '${ApiEndpoints.products}?categoryId=$categoryId',
    );
    
    return (response.data['data'] as List<dynamic>).map((e) => Product.fromJson(e)).toList();
  }

  @override
  Future<void> removeCategory(String id) async {
    final response = await _dio.delete(
       '${ApiEndpoints.categories}/$id',
    );
    if(response.data['data'] == "0"){
      throw Exception('Category not found');
    }
  }

  @override
  Future<void> removeCategoryWithChildren(String id) async {
    final response = await _dio.delete(
       '${ApiEndpoints.categories}/children/$id',
    );
    if(response.data['data'] == "0"){
      throw Exception('Category not found');
    }
  }

  @override
  Future<void> removeProduct(String id) async {
    final response = await _dio.delete(
       '${ApiEndpoints.products}/$id',
    );
    if(response.data['data'] == "0"){
      throw Exception('Item not found');
    }
  }

  @override
  Future<void> removeProducts(List<String> ids) async {
    final response = await _dio.delete(
       ApiEndpoints.products,
       data: ids
    );
    if(response.data['data'] == "${ids.length}"){
      throw Exception('All or One Item not found');
    }
  }

  @override
  Future<Category> saveCategory(CreateCategoryDto category) async {
    final response = await _dio.post(
      ApiEndpoints.categories,
      data: category.toJson(),
    );
    return Category.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<Product> saveProduct(CreateProductDto product) async {
    final response = await _dio.post(
      ApiEndpoints.products,
      data: product.toJson(),
    );

    return Product.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<Category> updateCategory(UpdateCategoryDto category, String categoryId) async {
    final response = await _dio.patch(
       '${ApiEndpoints.categories}/$categoryId',
       data: category
    );

    return Category.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<Product> updateProduct(UpdateProductDto product, String productId) async {
    final response = await _dio.patch(
       '${ApiEndpoints.products}/$productId',
       data: product
    );

    return Product.fromJson(response.data['data'] as Map<String, dynamic>);
  }
  
}