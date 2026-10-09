import 'package:dio/dio.dart';
import 'package:pos_app/core/network/api_endpoints.dart';
import 'package:pos_app/features/discount/data/models/dto/create_discount_dto.dart';
import 'package:pos_app/features/discount/data/models/dto/update_discount_dto.dart';
import 'package:pos_app/features/discount/domain/entities/discount.dart';

import 'discount_remote_datasource.dart';

class DiscountRemoteDatasourceImpl implements DiscountRemoteDatasource {
  DiscountRemoteDatasourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<Discount> updateDiscount(UpdateDiscountDto discount, String discountId) async {
   final response = await _dio.patch(
       '${ApiEndpoints.discounts}/$discountId',
       data: discount
    );

    return Discount.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<Discount?> getDiscount(String id) async {
    final response = await _dio.get(
      '${ApiEndpoints.discounts}/$id',
    );

    return Discount.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<List<Discount>> getDiscounts() async {
    final response = await _dio.get(
      ApiEndpoints.discounts
    );

    return (response.data['data']['discounts'] as List<dynamic>).map((e) => Discount.fromJson(e)).toList();
  }

  @override
  Future<void> removeDiscount(String id) async {
    final response = await _dio.delete(
       '${ApiEndpoints.discounts}/$id',
    );
    if(response.data['data'] == "0"){
      throw Exception('Item not found');
    }
  }

  @override
  Future<Discount> saveDiscount(CreateDiscountDto discount) async {
    final response = await _dio.post(
      ApiEndpoints.discounts,
      data: discount.toJson(),
    );

    return Discount.fromJson(response.data['data'] as Map<String, dynamic>);
  }
  
  @override
  Future<Discount> changeDiscountState(String discountId, bool newState) async {
    final response = await _dio.patch(
       '${ApiEndpoints.discounts}/$discountId',
       data: newState
    );

    return Discount.fromJson(response.data['data'] as Map<String, dynamic>);
  }
  
}