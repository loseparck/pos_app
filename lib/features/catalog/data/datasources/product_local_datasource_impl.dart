import 'package:drift/drift.dart';
import 'package:pos_app/data/local/db/app_database.dart';
import 'package:pos_app/features/catalog/data/mappers/catalog_mappers.dart';
import 'package:pos_app/features/catalog/domain/entities/option_item.dart';

import 'package:pos_app/features/catalog/domain/entities/product_option.dart';

import 'product_local_datasource.dart';

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  ProductLocalDataSourceImpl(this._db);

  final AppDatabase _db;

  @override
  Future<ProductOption> saveOption(ProductOption option) async {
    await _db.transaction(() async {
      final optionLocalId = await _db.into(_db.productOptionsDrift).insert(
        option.toDrift(),
        onConflict: DoUpdate(
          (_) => option.toDrift(),
          target: [_db.productOptionsDrift.remoteId],
        ),
      );
  
      for (final item in option.items) {
        await _db.into(_db.optionItemsDrift).insert(
          item.toDrift(optionLocalId, optionRemoteId: option.id),
          onConflict: DoUpdate(
            (_) => item.toDrift(optionLocalId, optionRemoteId: option.id),
            target: [_db.optionItemsDrift.remoteId],
          ),
        );
      }

      return option;
    });

    return option;
  }

  @override
  Future<OptionItem> saveItem(OptionItem item) async {
     await _db.transaction(() async {
      final option = await getOption(item.groupId);
      if(option == null){
        return;
      }

      await _db.into(_db.optionItemsDrift).insert(
        item.toDrift(option.id),
        onConflict: DoUpdate(
          (_) => item.toDrift(option.id),
          target: [_db.optionItemsDrift.remoteId],
        ),
      );
    });

    return item;
  }

  @override
  Future<List<OptionItem>> getItems() async{
    final itemRows = await (_db.select(_db.optionItemsDrift)
      ..where((tbl) => tbl.deletedAt.isNull()))
     .get();
    return itemRows.map((e) { return e.toEntity(); }).toList();
  }
  
  @override
  Future<OptionItemsDriftData?> getItem(String itemId) async {
    return await (_db.select(_db.optionItemsDrift)
      ..where((tbl) => tbl.deletedAt.isNull() & tbl.remoteId.equals(itemId)))
     .getSingleOrNull();
  }

  @override
  Future<List<OptionItem>> getItemByOptionId(String optionId) async {
    final itemRows = await (_db.select(_db.optionItemsDrift)
      ..where((tbl) => tbl.deletedAt.isNull() & tbl.groupId.equals(optionId)))
     .get();
    return itemRows.map((e) { return e.toEntity(); }).toList();
  }

  @override
  Future<ProductOptionsDriftData?> getOption(String id) async {
    final option = await (_db.select(_db.productOptionsDrift)
          ..where((tbl) => tbl.remoteId.equals(id) & tbl.deletedAt.isNull()))
        .getSingleOrNull();
    return option;
  }

  @override
  Future<ProductOption> getOptionWithItems(String id) async {
    final row = await (_db.select(_db.productOptionsDrift)
          ..where((tbl) => tbl.remoteId.equals(id) & tbl.deletedAt.isNull()))
        .getSingle();

    final itemRows = await (_db.select(_db.optionItemsDrift)
          ..where((tbl) => tbl.productOptionId.equals(row.id) & tbl.deletedAt.isNull()))
        .get();

    return ProductOption(
      id: row.remoteId,
      name: row.name,
      isMandatory: row.isMandatory,
      minToSelect: row.minToSelect,
      maxToSelect: row.maxToSelect,
      multipleSelect: row.multipleSelect,
      isActive: row.isActive,
      items: itemRows.map((e) {
        return OptionItem(
          id: e.remoteId,
          name: e.name,
          price: e.price,
          isActive: e.isActive,
          groupId: e.groupId
        );
      }).toList(),
    );
  }

  @override
  Future<List<ProductOption>> getOptions() async {
    final itemRows = await (_db.select(_db.productOptionsDrift)
          ..where((tbl) => tbl.deletedAt.isNull()))
        .get();

    return itemRows.map((e) { return e.toEntity(); }).toList();
  }
  
  @override
  Future<void> removeOption(String optionGroupId) async {
    await _db.transaction(() async {
      final now = DateTime.now();

      await (_db.update(_db.productOptionsDrift)
        ..where((tbl) => tbl.remoteId.equals(optionGroupId)))
        .write(
          ProductOptionsDriftCompanion(
            deletedAt: Value(now),
            updatedAt: Value(now),
          ),
        );

      await (_db.update(_db.optionItemsDrift)
        ..where((tbl) => tbl.groupId.equals(optionGroupId)))
        .write(
          OptionItemsDriftCompanion(
            deletedAt: Value(now),
            updatedAt: Value(now),
          ),
        );
    });
  }
  
  @override
  Future<void> removeItem(String itemId) async {
     await _db.transaction(() async {
      final now = DateTime.now();

      await (_db.update(_db.optionItemsDrift)
        ..where((tbl) => tbl.remoteId.equals(itemId)))
        .write(
          OptionItemsDriftCompanion(
            deletedAt: Value(now),
            updatedAt: Value(now),
          ),
        );
    });
  }

  @override
  Future<void> removeItems(List<String> itemsId) async {
     await _db.transaction(() async {
      final now = DateTime.now();

      await (_db.update(_db.optionItemsDrift)
        ..where((tbl) => tbl.remoteId.isIn(itemsId)))
        .write(
          OptionItemsDriftCompanion(
            deletedAt: Value(now),
            updatedAt: Value(now),
          ),
        );
    });
  }
  
  @override
  Future<OptionItem> updateItem(OptionItem item) async {
    item = item.copyWith(updatedAt: DateTime.now());
    await _db.transaction(() async {
      final itemDb = await getItem(item.id);
      
      if(itemDb == null){
        return;
      }
      
      await (_db.update(_db.optionItemsDrift)
        ..where((tbl) => tbl.remoteId.equals(item.id)))
      .write( item.toDrift(itemDb.productOptionId), );     
    });
    
    return item;
  }
  
  @override
  Future<ProductOption> updateOption(ProductOption option) async {
    option = option.copyWith(updatedAt: DateTime.now());
    await _db.transaction(() async {
      final optionDb = await getOption(option.id);
      if(optionDb == null){
        return;
      }

      await (_db.update(_db.productOptionsDrift)
        ..where((tbl) => tbl.remoteId.equals(option.id)))
      .write( option.toDrift(), );
    });
    return option;
  }

    /*@override
  Future<List<Product>> getProductsByGroup() {
    // TODO: implement getProductsByGroup
    throw UnimplementedError();
  }*/
}