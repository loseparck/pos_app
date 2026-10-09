import 'package:dio/dio.dart';
import 'package:pos_app/core/network/api_endpoints.dart';
import 'package:pos_app/features/customer/data/models/dto/create_customer_dto.dart';
import 'package:pos_app/features/customer/data/models/dto/update_customer_dto.dart';
import 'package:pos_app/features/customer/domain/entities/customer.dart';

import 'customer_remote_datasource.dart';

class CustomerRemoteDatasourceImpl implements CustomerRemoteDatasource {
  CustomerRemoteDatasourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<Customer> updateCustomer(UpdateCustomerDto customer, String customerId) async {
   final response = await _dio.patch(
       '${ApiEndpoints.customers}/$customerId',
       data: customer
    );

    return Customer.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<Customer?> getCustomer(String id) async {
    final response = await _dio.get(
      '${ApiEndpoints.customers}/$id',
    );

    return Customer.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<List<Customer>> getCustomers() async {
    final response = await _dio.get(
      ApiEndpoints.customers
    );

    return (response.data['data']['customers'] as List<dynamic>).map((e) => Customer.fromJson(e)).toList();
  }

  @override
  Future<void> removeCustomer(String id) async {
    final response = await _dio.delete(
       '${ApiEndpoints.customers}/$id',
    );
    if(response.data['data'] == "0"){
      throw Exception('Item not found');
    }
  }

  @override
  Future<Customer> saveCustomer(CreateCustomerDto customer) async {
    final response = await _dio.post(
      ApiEndpoints.customers,
      data: customer.toJson(),
    );

    return Customer.fromJson(response.data['data'] as Map<String, dynamic>);
  }
  
  @override
  Future<Customer> changeCustomerState(String customerId, bool newState) async {
    final response = await _dio.patch(
       '${ApiEndpoints.customers}/$customerId',
       data: newState
    );

    return Customer.fromJson(response.data['data'] as Map<String, dynamic>);
  }
  
}