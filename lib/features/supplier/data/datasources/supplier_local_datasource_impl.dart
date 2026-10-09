import 'package:drift/drift.dart';
import 'package:pos_app/data/local/db/app_database.dart';
import 'package:pos_app/features/supplier/data/mappers/supplier_mappers.dart';
import 'package:pos_app/features/supplier/domain/entities/supplier.dart';

import 'supplier_local_datasource.dart';

class SupplierLocalDatasourceImpl implements SupplierLocalDatasource {
  SupplierLocalDatasourceImpl(this._db);

  final AppDatabase? _db;

  @override
  Future<Supplier?> updateSupplier(Supplier supplier) async {
    if( _db == null){
      return null;
    }
    supplier = supplier.copyWith(updatedAt: DateTime.now());
    await  _db?.transaction(() async {
      final localSupplier = await getSupplier(supplier.id);
      
      if(localSupplier == null){
        return;
      }
      
      await ( _db!.update( _db!.suppliersDrift)
        ..where((tbl) => tbl.id.equals(supplier.id)))
      .write( supplier.toCompanion(), );     
    });
    
    return supplier;
  }
 
  @override
  Future<Supplier?> getSupplier(String id) async {
    if( _db == null){
      return null;
    }
    final supplier = await ( _db!.select( _db!.suppliersDrift)
          ..where((tbl) => tbl.id.equals(id) & tbl.deletedAt.isNull()))
        .getSingleOrNull();
    return supplier?.toModel();
  }

  @override
  Future<List<Supplier>> getSuppliers() async {
    if( _db == null){
      return [];
    }
    final suppliers = await ( _db!.select( _db!.suppliersDrift)
          ..where((tbl) => tbl.deletedAt.isNull()))
        .get();
    return suppliers.map((e) { return e.toModel(); }).toList();
  }

  @override
  Future<void> removeSupplier(String id) async {
    if( _db == null){
      return;
    }
    await  _db?.transaction(() async {
      final now = DateTime.now();

      await ( _db!.update( _db!.suppliersDrift)
        ..where((tbl) => tbl.id.equals(id)))
        .write(
          SuppliersDriftCompanion(
            deletedAt: Value(now),
            updatedAt: Value(now),
          ),
        );
    });
  }

  Future<void> removeSuppliers(List<String> ids) async {
    if( _db == null){
      return;
    }
    await  _db?.transaction(() async {
      final now = DateTime.now();

      await ( _db!.update( _db!.suppliersDrift)
        ..where((tbl) => tbl.id.isIn(ids)))
        .write(
          SuppliersDriftCompanion(
            deletedAt: Value(now),
            updatedAt: Value(now),
          ),
        );
    });
  }

  @override
  Future<Supplier?> saveSupplier(Supplier supplier) async {
    if( _db == null){
      return null;
    }
    await  _db?.transaction(() async {
      await  _db!.into( _db!.suppliersDrift).insert(
        supplier.toCompanion(),
        onConflict: DoUpdate(
          (_) => supplier.toCompanion(),
          target: [ _db!.categoriesDrift.id],
        ),
      );
    });

    return supplier;
  }
  
  @override
  Future<Supplier?> changeSupplierState(String supplierId, bool newState) async {
    if( _db == null){
      return null;
    }
    
    await  _db?.transaction(() async {
      final localSupplier = await getSupplier(supplierId);
      if(localSupplier == null){
        return null;
      }

      await ( _db!.update( _db!.suppliersDrift)
        ..where((tbl) => tbl.id.equals(localSupplier.id)))
      .write( localSupplier.copyWith(updatedAt: DateTime.now(), isActive: newState).toCompanion() );

      return localSupplier.copyWith(updatedAt: DateTime.now(), isActive: newState);
    });

    return null;
  }
  
}