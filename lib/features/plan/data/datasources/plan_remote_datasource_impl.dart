import 'package:dio/dio.dart';
import 'package:pos_app/core/network/api_endpoints.dart';
import 'package:pos_app/features/plan/data/mappers/plan_mappers.dart';
import 'package:pos_app/features/plan/data/models/dto/create_plan_dto.dart';
import 'package:pos_app/features/plan/data/models/dto/create_restaurant_table_dto.dart';
import 'package:pos_app/features/plan/data/models/dto/update_plan_dto.dart';
import 'package:pos_app/features/plan/data/models/dto/update_restaurant_table_dto.dart';
import 'package:pos_app/features/plan/domain/entities/plan.dart';
import 'package:pos_app/features/plan/domain/entities/restaurant_table.dart';

import 'plan_remote_datasource.dart';

class PlanRemoteDatasourceImpl implements PlanRemoteDatasource {
  PlanRemoteDatasourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<Plan?> getPlan(String planId) async {
    final response = await _dio.get(
      '${ApiEndpoints.plans}/$planId',
    );

    return Plan.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<List<Plan>> getPlans() async {
    final response = await _dio.get(
      ApiEndpoints.plans
    );

    return (response.data['data'] as List<dynamic>).map((e) => Plan.fromJson(e)).toList();
  }

  @override
  Future<List<Plan>> getPlansByIds(List<String> planId) async {
    final response = await _dio.get(
      ApiEndpoints.plans, data: planId
    );

    return (response.data['data']['plans'] as List<dynamic>).map((e) => Plan.fromJson(e)).toList();
  }

  @override
  Future<RestaurantTable?> getTable(String id) async {
    final response = await _dio.get(
      '${ApiEndpoints.tables}/$id',
    );

    return RestaurantTable.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<List<RestaurantTable>> getTables() async {
    final response = await _dio.get(
      ApiEndpoints.tables
    );

    return (response.data['data'] as List<dynamic>).map((e) => RestaurantTable.fromJson(e)).toList();
  }

  @override
  Future<List<RestaurantTable>> getTablesByIds(List<String> tableIds) async {
    final response = await _dio.get(
      ApiEndpoints.tables, data: tableIds
    );

    return (response.data['data']['tables'] as List<dynamic>).map((e) => RestaurantTable.fromJson(e)).toList();
  }

  @override
  Future<List<RestaurantTable>> getTablesByPlan(String planId) async {
    final response = await _dio.get(
       '${ApiEndpoints.tables}?planId=$planId',
    );
    
    return (response.data['data'] as List<dynamic>).map((e) => RestaurantTable.fromJson(e)).toList();
  }

  @override
  Future<void> removePlan(String planId) async {
    final response = await _dio.delete(
       '${ApiEndpoints.plans}/$planId',
    );

    if(response.data['data'] == "0"){
      throw Exception('Plan not found');
    }
  }

  @override
  Future<void> removePlans(List<String> planIds) async {
    final response = await _dio.delete(
       ApiEndpoints.plans, data: planIds
    );

    if(response.data['data'] == "0"){
      throw Exception('Plan not found');
    }
  }

  @override
  Future<void> removeTable(String tableId) async {
    final response = await _dio.delete(
       '${ApiEndpoints.tables}/$tableId',
    );
    
    if(response.data['data'] == "0"){
      throw Exception('Table not found');
    }
  }

  @override
  Future<void> removeTables(List<String> tableIds) async {
    final response = await _dio.delete(
       ApiEndpoints.tables, data: tableIds
    );

    if(response.data['data'] == "0"){
      throw Exception('Table not found');
    }
  }

  @override
  Future<Plan> savePlan(CreatePlanDto plan) async {
    final response = await _dio.post(
      ApiEndpoints.plans,
      data: plan.toJson(),
    );
    
    return Plan.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<List<Plan>> savePlans(List<CreatePlanDto> plans) async {
    await _dio.post(
      '${ApiEndpoints.plans}/bulk',
      data: plans.map((plan) => plan.toJson()).toList(),
    );

    return plans.map((e) => e.toEntity()).toList();
  }

  @override
  Future<RestaurantTable> saveTable(CreateRestaurantTableDto table) async {
    final response = await _dio.post(
      ApiEndpoints.tables,
      data: table.toJson(),
    );
    
    return RestaurantTable.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<List<RestaurantTable>> saveTables(List<CreateRestaurantTableDto> tables) async {
    await _dio.post(
      '${ApiEndpoints.tables}/bulk',
      data: tables.map((table) => table.toJson()).toList(),
    );

    return tables.map((e) => e.toEntity()).toList();
  }

  @override
  Future<Plan> updatPlan(UpdatePlanDto plan) async {
    final response = await _dio.patch(
       '${ApiEndpoints.plans}/${plan.id}',
       data: plan
    );

    return Plan.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<List<Plan>> updatPlans(List<UpdatePlanDto> plans) async {
    final response = await _dio.patch(
       ApiEndpoints.plans,
       data: plans
    );

    return (response.data['data'] as List<dynamic>).map((e) => Plan.fromJson(e)).toList();
  }

  @override
  Future<RestaurantTable> updateTable(UpdateRestaurantTableDto table) async {
   final response = await _dio.patch(
       '${ApiEndpoints.tables}/${table.id}',
       data: table
    );

    return RestaurantTable.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<List<RestaurantTable>> updateTables(List<UpdateRestaurantTableDto> tables) async {
    final response = await _dio.patch(
       ApiEndpoints.tables,
       data: tables
    );

    return (response.data['data'] as List<dynamic>).map((e) => RestaurantTable.fromJson(e)).toList();
  }
  
}