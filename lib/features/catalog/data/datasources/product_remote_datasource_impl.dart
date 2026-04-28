import 'package:dio/dio.dart';
import 'package:pos_app/core/network/api_endpoints.dart';
import 'package:pos_app/features/catalog/data/models/dto/create_option_item_dto.dart';
import 'package:pos_app/features/catalog/data/models/dto/create_product_option_dto.dart';
import 'package:pos_app/features/catalog/data/models/dto/update_option_item_dto.dart';
import 'package:pos_app/features/catalog/data/models/dto/update_product_option_dto.dart';
import 'package:pos_app/features/catalog/domain/entities/option_item.dart';
import 'package:pos_app/features/catalog/domain/entities/product_option.dart';

import 'product_remote_datasource.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  ProductRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<ProductOption> saveOption(CreateProductOptionDto option) async {
    final response = await _dio.post(
      ApiEndpoints.options,
      data: option.toJson(),
    );

    return ProductOption.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<OptionItem> saveItem(CreateOptionItemDto item) async {
    final response = await _dio.post(
      '${ApiEndpoints.options}/${item.groupId}${ApiEndpoints.items}',
      data: item.toJson(),
    );

    return OptionItem.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<OptionItem> getItem(String itemId) async {
    final response = await _dio.get(
      '${ApiEndpoints.options}${ApiEndpoints.items}/$itemId'
    );

    return OptionItem.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<List<OptionItem>> getItems() async {
    final response = await _dio.get(
      '${ApiEndpoints.options}${ApiEndpoints.items}',
    );
    
    return (response.data['data'] as List<dynamic>).map((e) => OptionItem.fromJson(e)).toList();
  }
  
  @override
  Future<List<OptionItem>> getItemByOptionId(String optionId) async {
    final response = await _dio.get(
       '${ApiEndpoints.options}/$optionId${ApiEndpoints.items}',
    );
    
    return (response.data['data'] as List<dynamic>).map((e) => OptionItem.fromJson(e)).toList();
  }

  @override
  Future<ProductOption> getOption(String id) async {
    final response = await _dio.get(
      '${ApiEndpoints.options}/$id',
    );

    return ProductOption.fromJson(response.data['data'] as Map<String, dynamic>);
  }
 
  @override
  Future<List<ProductOption>> getOptions() async {
    final response = await _dio.get(
      ApiEndpoints.options
    );

    return (response.data['data'] as List<dynamic>).map((e) => ProductOption.fromJson(e)).toList();
  }

  @override
  Future<ProductOption> getOptionWithItems(String id) {
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
  Future<void> removeOption(String optionId) async {
    final response = await _dio.delete(
       '${ApiEndpoints.options}/$optionId',
    );
    if(response.data['data'] == "0"){
      throw Exception('Item not found');
    }
  }

 
  @override
  Future<OptionItem> updateItem(UpdateOptionItemDto item, String itemId) async {
   final response = await _dio.patch(
       '${ApiEndpoints.options}${ApiEndpoints.items}/$itemId',
       data: item
    );

    return OptionItem.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<ProductOption> updateOption(UpdateProductOptionDto option, String optionId) async {
    final response = await _dio.patch(
       '${ApiEndpoints.options}/$optionId',
       data: option
    );

    return ProductOption.fromJson(response.data['data'] as Map<String, dynamic>);
  }
  
 
  /*@override
  Future<List<Product>> getProductsByGroup() {
    // TODO: implement getProductsByGroup
    throw UnimplementedError();
  }
*/
}