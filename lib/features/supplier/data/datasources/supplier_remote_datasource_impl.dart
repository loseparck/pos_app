import 'package:dio/dio.dart';
import 'package:pos_app/core/network/api_endpoints.dart';
import 'package:pos_app/features/supplier/data/models/dto/create_supplier_dto.dart';
import 'package:pos_app/features/supplier/data/models/dto/update_supplier_dto.dart';
import 'package:pos_app/features/supplier/domain/entities/supplier.dart';

import 'supplier_remote_datasource.dart';

class SupplierRemoteDatasourceImpl implements SupplierRemoteDatasource {
  SupplierRemoteDatasourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<Supplier> updateSupplier(UpdateSupplierDto supplier, String supplierId) async {
   final response = await _dio.patch(
       '${ApiEndpoints.suppliers}/$supplierId',
       data: supplier
    );

    return Supplier.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<Supplier?> getSupplier(String id) async {
    final response = await _dio.get(
      '${ApiEndpoints.suppliers}/$id',
    );

    return Supplier.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<List<Supplier>> getSuppliers() async {
    final response = await _dio.get(
      ApiEndpoints.suppliers
    );

    return (response.data['data']['suppliers'] as List<dynamic>).map((e) => Supplier.fromJson(e)).toList();
  }

  @override
  Future<void> removeSupplier(String id) async {
    final response = await _dio.delete(
       '${ApiEndpoints.suppliers}/$id',
    );
    if(response.data['data'] == "0"){
      throw Exception('Item not found');
    }
  }

  @override
  Future<Supplier> saveSupplier(CreateSupplierDto supplier) async {
    final response = await _dio.post(
      ApiEndpoints.suppliers,
      data: supplier.toJson(),
    );

    return Supplier.fromJson(response.data['data'] as Map<String, dynamic>);
  }
  
  @override
  Future<Supplier> changeSupplierState(String supplierId, bool newState) async {
    final response = await _dio.patch(
       '${ApiEndpoints.suppliers}/$supplierId',
       data: newState
    );

    return Supplier.fromJson(response.data['data'] as Map<String, dynamic>);
  }
  
}