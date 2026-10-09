import 'package:drift/drift.dart';
import 'package:pos_app/data/local/db/app_database.dart';
import 'package:pos_app/features/customer/data/mappers/customer_mappers.dart';
import 'package:pos_app/features/customer/domain/entities/customer.dart';

import 'customer_local_datasource.dart';

class CustomerLocalDatasourceImpl implements CustomerLocalDatasource {
  CustomerLocalDatasourceImpl(this._db);

  final AppDatabase? _db;

  @override
  Future<Customer?> updateCustomer(Customer customer) async {
    if( _db == null){
      return null;
    }
    customer = customer.copyWith(updatedAt: DateTime.now());
    await  _db?.transaction(() async {
      final localCustomer = await getCustomer(customer.id);
      
      if(localCustomer == null){
        return;
      }
      
      await ( _db!.update( _db!.customersDrift)
        ..where((tbl) => tbl.id.equals(customer.id)))
      .write(customer.toCompanion(), );     
    });
    
    return customer;
  }
 
  @override
  Future<Customer?> getCustomer(String id) async {
    if( _db == null){
      return null;
    }
    final customer = await ( _db!.select( _db!.customersDrift)
          ..where((tbl) => tbl.id.equals(id) & tbl.deletedAt.isNull()))
        .getSingleOrNull();
    return customer?.toModel();
  }

  @override
  Future<List<Customer>> getCustomers() async {
    if( _db == null){
      return [];
    }
    final customers = await ( _db!.select( _db!.customersDrift)
          ..where((tbl) => tbl.deletedAt.isNull()))
        .get();
    return customers.map((e) { return e.toModel(); }).toList();
  }

  @override
  Future<void> removeCustomer(String id) async {
    if( _db == null){
      return;
    }
    await  _db?.transaction(() async {
      final now = DateTime.now();

      await ( _db!.update( _db!.customersDrift)
        ..where((tbl) => tbl.id.equals(id)))
        .write(
          CustomersDriftCompanion(
            deletedAt: Value(now),
            updatedAt: Value(now),
          ),
        );
    });
  }

  Future<void> removeCustomers(List<String> ids) async {
    if( _db == null){
      return;
    }
    await  _db?.transaction(() async {
      final now = DateTime.now();

      await ( _db!.update( _db!.customersDrift)
        ..where((tbl) => tbl.id.isIn(ids)))
        .write(
          CustomersDriftCompanion(
            deletedAt: Value(now),
            updatedAt: Value(now),
          ),
        );
    });
  }

  @override
  Future<Customer?> saveCustomer(Customer customer) async {
    if( _db == null){
      return null;
    }
    await  _db?.transaction(() async {
      await  _db!.into( _db!.customersDrift).insert(
        customer.toCompanion(),
        onConflict: DoUpdate(
          (_) => customer.toCompanion(),
          target: [ _db!.categoriesDrift.id],
        ),
      );
    });

    return customer;
  }
  
  @override
  Future<Customer?> changeCustomerState(String customerId, bool newState) async {
    if( _db == null){
      return null;
    }
    
    await  _db?.transaction(() async {
      final localCustomer = await getCustomer(customerId);
      if(localCustomer == null){
        return null;
      }

      await ( _db!.update( _db!.customersDrift)
        ..where((tbl) => tbl.id.equals(localCustomer.id)))
      .write( localCustomer.copyWith(updatedAt: DateTime.now(), isActive: newState).toCompanion() );

      return localCustomer.copyWith(updatedAt: DateTime.now(), isActive: newState);
    });

    return null;
  }
  
}