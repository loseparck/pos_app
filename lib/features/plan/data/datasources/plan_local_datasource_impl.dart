import 'package:drift/drift.dart';
import 'package:pos_app/data/local/db/app_database.dart';
import 'package:pos_app/features/plan/data/mappers/plan_mappers.dart';
import 'package:pos_app/features/plan/domain/entities/plan.dart';
import 'package:pos_app/features/plan/domain/entities/restaurant_table.dart';

import 'plan_local_datasource.dart';

class PlanLocalDataSourceImpl implements PlanLocalDataSource {
  PlanLocalDataSourceImpl(this._db);

  final AppDatabase? _db;

  @override
  Future<Plan?> getPlan(String planId) async {
    if( _db == null){
      return null;
    }
    final plan = await ( _db!.select( _db!.planDrift)
          ..where((pln) => pln.id.equals(planId) & pln.deletedAt.isNull()))
        .getSingleOrNull();

    return plan?.toEntity();
  }

  @override
  Future<List<Plan>> getPlans() async {
    if( _db == null){
      return [];
    }
    //await _db!.delete(_db!.orderItemDrift).go();
    //await _db!.delete(_db!.orderDrift).go();
   // await _db!.delete(_db!.restaurantTableDrift).go();
    //await _db!.delete(_db!.planDrift).go();
    final plans = await ( _db!.select( _db!.planDrift)
          ..where((tbl) => tbl.deletedAt.isNull()))
        .get();

    return plans.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<Plan>> getPlansByIds(List<String> planIds) async {
    if( _db == null){
      return [];
    }
    final plans = await ( _db!.select( _db!.planDrift)
          ..where((tbl) => tbl.id.isIn(planIds)))
        .get();

    return plans.map((e) => e.toEntity()).toList();
  }

  @override
  Future<RestaurantTable?> getTable(String tableId) async {
    if( _db == null){
      return null;
    }
    final table = await ( _db!.select( _db!.restaurantTableDrift)
          ..where((tbl) => tbl.id.equals(tableId) & tbl.deletedAt.isNull()))
        .getSingleOrNull();

    return table?.toEntity();
  }

  @override
  Future<List<RestaurantTable>> getTables() async {
    if( _db == null){
      return [];
    }
    final tables = await ( _db!.select( _db!.restaurantTableDrift)
          ..where((tbl) => tbl.deletedAt.isNull()))
        .get();

    return tables.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<RestaurantTable>> getTablesByIds(List<String> tableIds) async {
    if( _db == null){
      return [];
    }
    final tables = await ( _db!.select( _db!.restaurantTableDrift)
          ..where((tbl) => tbl.id.isIn(tableIds)))
        .get();

    return tables.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<RestaurantTable>> getTablesByPlan(String planId) async {
    if( _db == null){
      return [];
    }

    final tables = await ( _db!.select( _db!.restaurantTableDrift)
          ..where((tbl) => tbl.planId.equals(planId) & tbl.deletedAt.isNull()))
        .get();

    return tables.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> removePlan(String planId) async {
    if( _db == null){
      return;
    }

    await  _db?.transaction(() async {
      final now = DateTime.now();

      await ( _db!.update( _db!.planDrift)
        ..where((tbl) => tbl.id.equals(planId)))
        .write(
          PlanDriftCompanion(
            deletedAt: Value(now),
            updatedAt: Value(now),
          ),
        );
    });
  }

  @override
  Future<void> removePlans(List<String> planIds) async {
    if( _db == null){
      return;
    }
    
    await  _db?.transaction(() async {
      final now = DateTime.now();

      await ( _db!.update( _db!.planDrift)
        ..where((tbl) => tbl.id.isIn(planIds)))
        .write(
          PlanDriftCompanion(
            deletedAt: Value(now),
            updatedAt: Value(now),
          ),
        );
    });
  }

  @override
  Future<void> removeTable(String tableId) async {
    if( _db == null){
      return;
    }

    await  _db?.transaction(() async {
      final now = DateTime.now();

      await ( _db!.update( _db!.restaurantTableDrift)
        ..where((tbl) => tbl.id.equals(tableId)))
        .write(
          RestaurantTableDriftCompanion(
            deletedAt: Value(now),
            updatedAt: Value(now),
          ),
        );
    });
  }

  @override
  Future<void> removeTables(List<String> tableIds) async {
     if( _db == null){
      return;
    }
    
    await  _db?.transaction(() async {
      final now = DateTime.now();

      await ( _db!.update( _db!.restaurantTableDrift)
        ..where((tbl) => tbl.id.isIn(tableIds)))
        .write(
          RestaurantTableDriftCompanion(
            deletedAt: Value(now),
            updatedAt: Value(now),
          ),
        );
    });
  }

  @override
  Future<Plan?> savePlan(Plan plan) async {
    if( _db == null){
      return null;
    }
    await _db?.transaction(() async {
      await _db?.into(_db!.planDrift).insert(
        plan.toCompanion(),
        onConflict: DoUpdate(
          (_) => plan.toCompanion(),
          target: [ _db!.planDrift.id],
        ),
      );

      return plan;
    });
    return plan;
  }

  @override
  Future<List<Plan>> savePlans(List<Plan> plans) async {
    if( _db == null){
      return [];
    }
    await _db?.transaction(() async {
      await  _db?.batch((batch) async {
        batch.insertAll( _db!.planDrift, plans.map((plan) => plan.toCompanion()).toList() , mode: InsertMode.insertOrIgnore);
      });

      return plans;
    });
    return plans;
  }

  @override
  Future<RestaurantTable?> saveTable(RestaurantTable table) async {
    if( _db == null){
      return null;
    }
    await _db?.transaction(() async {
      await _db?.into(_db!.restaurantTableDrift).insert(
        table.toCompanion(),
        onConflict: DoUpdate(
          (_) => table.toCompanion(),
          target: [ _db!.restaurantTableDrift.id],
        ),
      );

      return table;
    });
    return table;
  }

  @override
  Future<List<RestaurantTable>> saveTables(List<RestaurantTable> tables) async {
    if( _db == null){
      return [];
    }
    await _db?.transaction(() async {
      await  _db?.batch((batch) async {
        batch.insertAll( _db!.restaurantTableDrift, tables.map((table) => table.toCompanion()).toList() , mode: InsertMode.insertOrIgnore);
      });

      return tables;
    });
    return tables;
  }

  @override
  Future<Plan?> updatPlan(Plan plan) async {
    if( _db == null){
      return null;
    }
    
    plan = plan.copyWith(updatedAt: DateTime.now());
    await  _db?.transaction(() async {
      final localPlan = await getPlan(plan.id);
      if(localPlan == null){
        return;
      }

      await ( _db!.update( _db!.planDrift)
        ..where((tbl) => tbl.id.equals(plan.id)))
      .write( plan.toCompanion() 
      
      );
    });


    return plan;
  }

  @override
  Future<List<Plan>> updatPlans(List<Plan> plans) async {
    if( _db == null){
      return [];
    }
    await _db?.transaction(() async {
      await  _db?.batch((batch) async {
        for (final plan in plans) {
          batch.update(
            _db!.planDrift,
            plan.toCompanion(),
            where: (t) => t.id.equals(plan.id),
          );
        }
      });
      return plans;
    });
    return plans;
  }

  @override
  Future<RestaurantTable?> updateTable(RestaurantTable table) async {
    if( _db == null){
      return null;
    }
    
    await  _db?.transaction(() async {
      final localTable = await getTable(table.id);
      if(localTable == null){
        return;
      }

      await ( _db!.update( _db!.restaurantTableDrift)
        ..where((tbl) => tbl.id.equals(table.id)))
      .write( table.toCompanion() 
      
      );
    });

    return table;
  }

  @override
  Future<List<RestaurantTable>> updateTables(List<RestaurantTable> tables) async {
    if( _db == null){
      return [];
    }
    await _db?.transaction(() async {
      await  _db?.batch((batch) async {
        for (final table in tables) {
          batch.update(
            _db!.restaurantTableDrift,
            table.toCompanion(),
            where: (t) => t.id.equals(table.id),
          );
        }
      });
      return tables;
    });
    return tables;
  }
  
}