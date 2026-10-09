import 'package:drift/drift.dart';
import 'package:pos_app/data/local/db/app_database.dart';
import 'package:pos_app/features/discount/data/mappers/discount_mappers.dart';
import 'package:pos_app/features/discount/domain/entities/discount.dart';

import 'discount_local_datasource.dart';

class DiscountLocalDatasourceImpl implements DiscountLocalDatasource {
  DiscountLocalDatasourceImpl(this._db);

  final AppDatabase? _db;

  @override
  Future<Discount?> updateDiscount(Discount discount) async {
    if( _db == null){
      return null;
    }
    discount = discount.copyWith(updatedAt: DateTime.now());
    await  _db?.transaction(() async {
      final localDiscount = await getDiscount(discount.id);
      
      if(localDiscount == null){
        return;
      }
      
      await ( _db!.update( _db!.discountsDrift)
        ..where((tbl) => tbl.id.equals(discount.id)))
      .write( discount.toCompanion(), );     
    });
    
    return discount;
  }
 
  @override
  Future<Discount?> getDiscount(String id) async {
    if( _db == null){
      return null;
    }
    final discount = await ( _db!.select( _db!.discountsDrift)
          ..where((tbl) => tbl.id.equals(id) & tbl.deletedAt.isNull()))
        .getSingleOrNull();
    return discount?.toEntity();
  }

  @override
  Future<List<Discount>> getDiscounts() async {
    if( _db == null){
      return [];
    }
    final discounts = await ( _db!.select( _db!.discountsDrift)
          ..where((tbl) => tbl.deletedAt.isNull()))
        .get();
    return discounts.map((e) { return e.toEntity(); }).toList();
  }

  @override
  Future<void> removeDiscount(String id) async {
    if( _db == null){
      return;
    }
    await  _db?.transaction(() async {
      final now = DateTime.now();

      await ( _db!.update( _db!.discountsDrift)
        ..where((tbl) => tbl.id.equals(id)))
        .write(
          DiscountsDriftCompanion(
            deletedAt: Value(now),
            updatedAt: Value(now),
          ),
        );
    });
  }

  Future<void> removeDiscounts(List<String> ids) async {
    if( _db == null){
      return;
    }
    await  _db?.transaction(() async {
      final now = DateTime.now();

      await ( _db!.update( _db!.discountsDrift)
        ..where((tbl) => tbl.id.isIn(ids)))
        .write(
          DiscountsDriftCompanion(
            deletedAt: Value(now),
            updatedAt: Value(now),
          ),
        );
    });
  }

  @override
  Future<Discount?> saveDiscount(Discount discount) async {
    if( _db == null){
      return null;
    }
    await  _db?.transaction(() async {
      await  _db!.into( _db!.discountsDrift).insert(
        discount.toCompanion(),
        onConflict: DoUpdate(
          (_) => discount.toCompanion(),
          target: [ _db!.categoriesDrift.id],
        ),
      );
    });

    return discount;
  }
  
  @override
  Future<Discount?> changeDiscountState(String discountId, bool newState) async {
    if( _db == null){
      return null;
    }
    
    await  _db?.transaction(() async {
      final localDiscount = await getDiscount(discountId);
      if(localDiscount == null){
        return null;
      }

      await ( _db!.update( _db!.discountsDrift)
        ..where((tbl) => tbl.id.equals(localDiscount.id)))
      .write( localDiscount.copyWith(updatedAt: DateTime.now(), isActive: newState).toCompanion() );

      return localDiscount.copyWith(updatedAt: DateTime.now(), isActive: newState);
    });

    return null;
  }
  
}