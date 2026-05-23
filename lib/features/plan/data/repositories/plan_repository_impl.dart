import 'package:pos_app/core/network/connectivity_service.dart';
import 'package:pos_app/features/plan/data/datasources/plan_local_datasource.dart';
import 'package:pos_app/features/plan/data/datasources/plan_remote_datasource.dart';
import 'package:pos_app/features/plan/data/mappers/plan_mappers.dart';
import 'package:pos_app/features/plan/data/repositories/plan_repository.dart';
import 'package:pos_app/features/plan/domain/entities/plan.dart';
import 'package:pos_app/features/plan/domain/entities/restaurant_table.dart';
import 'package:uuid/uuid.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class PlanRepositoryImpl implements PlanRepository {
  PlanRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._connectivity
  );

  final PlanRemoteDatasource _remoteDataSource;
  final PlanLocalDataSource _localDataSource;
  final ConnectivityService _connectivity;

  final _uuid = const Uuid();

  @override
  Future<Plan?> getPlan(String planId) async {
    late final Plan? plan;
    if(!kIsWeb) {
      plan = await _localDataSource.getPlan(planId);
      if(plan != null){
        return plan;
      }
    } 
    
    if(await _connectivity.isOnline()) {
      return _remoteDataSource.getPlan(planId);
    }

    return plan;
  }

  @override
  Future<List<Plan>> getPlans() async {
    final List<Plan> plans = [];
    if(!kIsWeb) {
      plans.addAll(await _localDataSource.getPlans());
      if(plans.isNotEmpty){
        return plans;
      }
    }

    if(await _connectivity.isOnline()) {
      return _remoteDataSource.getPlans();
    }

    return plans;
  }

  @override
  Future<List<Plan>> getPlansByIds(List<String> planId) async {
    final List<Plan> plans = [];
    if(!kIsWeb) {
      plans.addAll(await _localDataSource.getPlansByIds(planId));
      if(plans.isNotEmpty){
        return plans;
      }
    }

    if(await _connectivity.isOnline()) {
      return _remoteDataSource.getPlansByIds(planId);
    }

    return plans;
  }

  @override
  Future<RestaurantTable?> getTable(String tableId) async {
    late final RestaurantTable? table;
    if(!kIsWeb) {
      table = await _localDataSource.getTable(tableId);
      if(table != null){
        return table;
      }
    } 
    
    if(await _connectivity.isOnline()) {
      return _remoteDataSource.getTable(tableId);
    }

    return table;
  }

  @override
  Future<List<RestaurantTable>> getTables() async {
    final List<RestaurantTable> tables = [];
    if(!kIsWeb) {
      tables.addAll(await _localDataSource.getTables());
      if(tables.isNotEmpty){
        return tables;
      }
    }

    if(await _connectivity.isOnline()) {
      return _remoteDataSource.getTables();
    }

    return tables;
  }

  @override
  Future<List<RestaurantTable>> getTablesByIds(List<String> tableIds) async {
    final List<RestaurantTable> tables = [];
    if(!kIsWeb) {
      tables.addAll(await _localDataSource.getTablesByIds(tableIds));
      if(tables.isNotEmpty){
        return tables;
      }
    }

    if(await _connectivity.isOnline()) {
      return _remoteDataSource.getTablesByIds(tableIds);
    }

    return tables;
  }

  @override
  Future<List<RestaurantTable>> getTablesByPlan(String planId) async {
    final List<RestaurantTable> tables = [];
    if(!kIsWeb) {
      tables.addAll(await _localDataSource.getTablesByPlan(planId));
      if(tables.isNotEmpty){
        return tables;
      }
    }

    if(await _connectivity.isOnline()) {
      return _remoteDataSource.getTablesByPlan(planId);
    }

    return tables;
  }

  @override
  Future<void> removePlan(String planId) async {
    if(!kIsWeb) {
      await _localDataSource.removePlan(planId);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.removePlan(planId);
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }
  }

  @override
  Future<void> removePlans(List<String> planIds) async {
    if(!kIsWeb) {
      await _localDataSource.removePlans(planIds);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.removePlans(planIds);
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }
  }

  @override
  Future<void> removeTable(String tableId) async {
    if(!kIsWeb) {
      await _localDataSource.removeTable(tableId);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.removeTable(tableId);
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }
  }

  @override
  Future<void> removeTables(List<String> tableIds) async {
    if(!kIsWeb) {
      await _localDataSource.removeTables(tableIds);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.removeTables(tableIds);
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }
  }

  @override
  Future<Plan> savePlan(Plan plan) async {
    plan = plan.copyWith(
      id: _uuid.v4(),
    );

    if(!kIsWeb) {
      await _localDataSource.savePlan(plan);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.savePlan(plan.toCreateDto());
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }

    return plan;
  }

  @override
  Future<List<Plan>> savePlans(List<Plan> plans) async {
    plans = plans.map((plan) => plan.copyWith(id: _uuid.v4())).toList();

    if(!kIsWeb) {
      await _localDataSource.savePlans(plans);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.savePlans(plans.map((plan)=> plan.toCreateDto()).toList());
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }

    return plans;
  }

  @override
  Future<RestaurantTable> saveTable(RestaurantTable table) async {
    table = table.copyWith(
      id: _uuid.v4(),
    );

    if(!kIsWeb) {
      await _localDataSource.saveTable(table);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.saveTable(table.toCreateDto());
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }

    return table;
  }

  @override
  Future<List<RestaurantTable>> saveTables(List<RestaurantTable> tables) async {
    tables = tables.map((plan) => plan.copyWith(id: _uuid.v4())).toList();

    if(!kIsWeb) {
      await _localDataSource.saveTables(tables);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.saveTables(tables.map((table)=> table.toCreateDto()).toList());
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }

    return tables;
  }

  @override
  Future<Plan> updatPlan(Plan plan) async {
    if(!kIsWeb) {
      _localDataSource.updatPlan(plan);
    } 
    
    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.updatPlan(plan.toUpdateDto());
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }

    return plan;
  }

  @override
  Future<List<Plan>> updatPlans(List<Plan> plans) async {
    if(!kIsWeb) {
      await _localDataSource.updatPlans(plans);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.updatPlans(plans.map((plan)=> plan.toUpdateDto()).toList());
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }

    return plans;
  }

  @override
  Future<RestaurantTable> updateTable(RestaurantTable table) async {
    if(!kIsWeb) {
      _localDataSource.updateTable(table);
    } 
    
    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.updateTable(table.toUpdateDto());
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }

    return table;
  }

  @override
  Future<List<RestaurantTable>> updateTables(List<RestaurantTable> tables) async {
    if(!kIsWeb) {
      await _localDataSource.updateTables(tables);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.updateTables(tables.map((table)=> table.toUpdateDto()).toList());
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }

    return tables;
  }

}