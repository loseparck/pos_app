import 'package:drift/drift.dart';
import 'package:pos_app/data/local/db/app_database.dart';
import 'package:pos_app/features/catalog/data/mappers/catalog_mappers.dart';
import 'package:pos_app/features/catalog/domain/entities/category.dart';
import 'package:pos_app/features/catalog/domain/entities/discount.dart';
import 'package:pos_app/features/catalog/domain/entities/item.dart';

import 'package:pos_app/features/catalog/domain/entities/option.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';

import 'product_local_datasource.dart';

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  ProductLocalDataSourceImpl(this._db);

  final AppDatabase? _db;

  @override
  Future<Option?> saveOption(Option option) async {
    if( _db == null){
      return null;
    }
    await _db?.transaction(() async {
      await _db?.into(_db!.optionsDrift).insert(
        option.toDrift(),
        onConflict: DoUpdate(
          (_) => option.toDrift(),
          target: [ _db!.optionsDrift.id],
        ),
      );
      //TODO refactore insert item
      for (final item in option.items) {
        await  _db?.into( _db!.itemsDrift).insert(
          item.toDrift(option.id),
          onConflict: DoUpdate(
            (_) => item.toDrift(option.id),
            target: [ _db!.itemsDrift.id],
          ),
        );
      }

      return option;
    });
    return option;
  }

  @override
  Future<Item?> saveItem(Item item) async {
    if( _db == null){
      return null;
    }
    await  _db?.transaction(() async {
      final option = await getOption(item.option.id);
      if(option == null){
        return;
      }

      await  _db?.into( _db!.itemsDrift).insert(
        item.toDrift(option.id),
        onConflict: DoUpdate(
          (_) => item.toDrift(option.id),
          target: [ _db!.itemsDrift.id],
        ),
      );
    });
    return item;
  }

  @override
  Future<List<Item>> getItems() async{
    if( _db != null){
    final itemRows = await ( _db!.select( _db!.itemsDrift)
      ..where((tbl) => tbl.deletedAt.isNull()))
     .get();
    return itemRows.map((e) { return e.toEntity(Option(name: "", items: [], id: e.optionId)); }).toList();
    }
    return [];
  }
  
  @override
  Future<ItemsDriftData?> getItem(String itemId) async {
    if( _db != null){
      return await ( _db!.select( _db!.itemsDrift)
        ..where((tbl) => tbl.deletedAt.isNull() & tbl.id.equals(itemId)))
      .getSingleOrNull();
    }
    return null;
  }

  @override
  Future<List<Item>> getItemByOptionId(String optionId) async {
    if( _db != null){
      final option = await getOption(optionId);
      if(option == null){
        throw Exception("Option Not Found");
      }
      final itemRows = await ( _db!.select( _db!.itemsDrift)
        ..where((tbl) => tbl.deletedAt.isNull() & tbl.optionId.equals(optionId)))
      .get();
      return itemRows.map((e) { return e.toEntity(option.toEntity()); }).toList();
    }
    return [];
  }

  @override
  Future<OptionsDriftData?> getOption(String id) async {
    if( _db == null){
      return null;
    }
    final option = await ( _db!.select( _db!.optionsDrift)
          ..where((tbl) => tbl.id.equals(id) & tbl.deletedAt.isNull()))
        .getSingleOrNull();
    return option;
  }

  @override
  Future<Option?> getOptionWithItems(String id) async {
    if( _db == null){
      return null;
    }
    final row = await ( _db!.select( _db!.optionsDrift)
          ..where((tbl) => tbl.id.equals(id) & tbl.deletedAt.isNull()))
        .getSingle();

    final itemRows = await ( _db!.select( _db!.itemsDrift)
          ..where((tbl) => tbl.optionId.equals(row.id) & tbl.deletedAt.isNull()))
        .get();

    return Option(
      id: row.id,
      name: row.name,
      isMandatory: row.isMandatory,
      minToSelect: row.minToSelect,
      maxToSelect: row.maxToSelect,
      allowDuplicateSelection: row.multipleSelect,
      isActive: row.isActive,
      items: itemRows.map((e) {
        return Item(
          id: e.id,
          name: e.name,
          price: e.price,
          isActive: e.isActive,
          option: row.toEntity()
        );
      }).toList(),
    );
  }

  @override
  Future<List<Option>> getOptions() async {
    if( _db == null){
      return [];
    }
    final itemRows = await ( _db!.select( _db!.optionsDrift)
          ..where((tbl) => tbl.deletedAt.isNull()))
        .get();

    return itemRows.map((e) { return e.toEntity(); }).toList();
  }
  
  @override
  Future<void> removeOption(String optionGroupId) async {
    if( _db == null){
      return;
    }
    await  _db?.transaction(() async {
      final now = DateTime.now();

      await ( _db!.update( _db!.optionsDrift)
        ..where((tbl) => tbl.id.equals(optionGroupId)))
        .write(
          OptionsDriftCompanion(
            deletedAt: Value(now),
            updatedAt: Value(now),
          ),
        );

      await ( _db!.update( _db!.itemsDrift)
        ..where((tbl) => tbl.optionId.equals(optionGroupId)))
        .write(
          ItemsDriftCompanion(
            deletedAt: Value(now),
            updatedAt: Value(now),
          ),
        );
    });
  }
  
  @override
  Future<void> removeItem(String itemId) async {
    if( _db == null){
      return;
    }
     await  _db?.transaction(() async {
      final now = DateTime.now();

      await ( _db!.update( _db!.itemsDrift)
        ..where((tbl) => tbl.id.equals(itemId)))
        .write(
          ItemsDriftCompanion(
            deletedAt: Value(now),
            updatedAt: Value(now),
          ),
        );
    });
  }

  @override
  Future<void> removeItems(List<String> ids) async {
    if( _db == null){
      return;
    }
     await  _db?.transaction(() async {
      final now = DateTime.now();

      await ( _db!.update( _db!.itemsDrift)
        ..where((tbl) => tbl.id.isIn(ids)))
        .write(
          ItemsDriftCompanion(
            deletedAt: Value(now),
            updatedAt: Value(now),
          ),
        );
    });
  }
  
  @override
  Future<Item?> updateItem(Item item) async {
    if( _db == null){
      return null;
    }
    item = item.copyWith(updatedAt: DateTime.now());
    await  _db?.transaction(() async {
      final itemDb = await getItem(item.id);
      
      if(itemDb == null){
        return;
      }
      
      await ( _db!.update( _db!.itemsDrift)
        ..where((tbl) => tbl.id.equals(item.id)))
      .write( item.toDrift(itemDb.optionId), );     
    });
    
    return item;
  }
  
  @override
  Future<Option?> updateOption(Option option) async {
    if( _db == null){
      return null;
    }
    option = option.copyWith(updatedAt: DateTime.now());
    await  _db?.transaction(() async {
      final optionDb = await getOption(option.id);
      if(optionDb == null){
        return;
      }

      await ( _db!.update( _db!.optionsDrift)
        ..where((tbl) => tbl.id.equals(option.id)))
      .write( option.toDrift(), );
    });
    return option;
  }

    @override
  Future<Category?> saveCategory(Category category) async {
    if( _db == null){
      return null;
    }
    await  _db?.transaction(() async {
      if(category.parent != null){
        final parentCategory = await getCategory(category.parent?.id ?? '');
        if(parentCategory == null){
          return;
        }
      }

      await  _db!.into( _db!.categoriesDrift).insert(
        category.toCompanion(),
        onConflict: DoUpdate(
          (_) => category.toCompanion(),
          target: [ _db!.categoriesDrift.id],
        ),
      );
    });

    return category;
  }

  @override
  Future<Product?> saveProduct(Product product) async {
    if( _db == null){
      return null;
    }
    await  _db?.transaction(() async {
      if(product.category != null){
        final category = await getCategory(product.category?.id ?? '');
        if(category == null){
          throw Exception("Category Not Found!");
        }
      }

      await  _db?.into( _db!.productsDrift).insert(
        product.toCompanion(),
        onConflict: DoUpdate(
          (_) => product.toCompanion(),
          target: [ _db!.productsDrift.id],
        ),
      );

      if(product.options != null && product.options!.isNotEmpty){
          final listOption = product.options!.map((option) => 
            ProductsOptionsDriftCompanion(
              createdAt: Value(DateTime.now()),
              updatedAt: Value(DateTime.now()),
              optionId: Value(option.id),
              productId: Value(product.id),
            )
          ).toList();

          await  _db?.batch((batch) {
            batch.insertAll( _db!.productsOptionsDrift, listOption, mode: InsertMode.insertOrIgnore);
          });
      }
    });

    return product;
  }

  @override
  Future<List<Category>> getCategories() async {
    if( _db == null){
      return [];
    }
    final categories = await ( _db!.select( _db!.categoriesDrift)
          ..where((tbl) => tbl.deletedAt.isNull()))
        .get();

    return categories.map((e) { return e.toEntity(e.parentId != null ? Category(name: '', id: e.parentId ?? ''): null); }).toList();
  }

  @override
  Future<Category?> getCategory(String id) async {
    if( _db == null){
      return null;
    }
    final category = await ( _db!.select( _db!.categoriesDrift)
          ..where((tbl) => tbl.id.equals(id) & tbl.deletedAt.isNull()))
        .getSingleOrNull();
    return category?.toEntity(category.parentId != null ? Category(name: '', id: category.parentId ?? ''): null);
  }

  @override
  Future<Product?> getProduct(String productId) async {
    if( _db == null){
      return null;
    }

    final product = await ( _db!.select( _db!.productsDrift)
          ..where((tbl) => tbl.id.equals(productId) & tbl.deletedAt.isNull()))
        .getSingleOrNull();

    if (product == null) return null;

    final optionRows = await (_db!.select(_db!.optionsDrift).join([
        innerJoin(
          _db!.productsOptionsDrift,
          _db!.productsOptionsDrift.optionId.equalsExp(_db!.optionsDrift.id),
        ),
      ])
            ..where(_db!.productsOptionsDrift.productId.equals(productId)))
          .get();

    final options = optionRows.map((row) {
      final optionRow = row.readTable(_db!.optionsDrift);
      return optionRow.toEntity();
    }).toList();

    return product.toEntityWithOption(product.categoryId != null ? Category(name: '', id: product.categoryId ?? ''): null, options);
  }

  @override
  Future<List<Product>> getProducts() async {
    if( _db == null){
      return [];
    }
    final products = await ( _db!.select( _db!.productsDrift)
          ..where((tbl) => tbl.deletedAt.isNull()))
        .get();

    final optionRows = await (_db!.select(_db!.optionsDrift).join([
          innerJoin(
            _db!.productsOptionsDrift,
            _db!.productsOptionsDrift.optionId.equalsExp(_db!.optionsDrift.id),
          ),
        ])).get();

    final optionsByProductId = <String, List<Option>>{};

    for (final row in optionRows) {
      final option = row.readTable( _db!.optionsDrift);
      final relation = row.readTable( _db!.productsOptionsDrift);

      optionsByProductId
          .putIfAbsent(relation.productId, () => [])
          .add(option.toEntity());
    }

    return products.map((e) {
      return e.toEntityWithOption(e.categoryId != null ? Category(name: '', id: e.categoryId ?? ''): null, optionsByProductId[e.id] ?? []);
    }).toList();
  }

  @override
  Future<List<Product>> getProductsByCategory(String categoryId) async {
    if( _db == null){
      return [];
    }
    final category = await getCategory(categoryId);
    if(category == null){
      throw Exception("Category Not Found");
    }

    final products = await ( _db!.select( _db!.productsDrift)
      ..where((tbl) => tbl.deletedAt.isNull() & tbl.categoryId.equals(categoryId)))
     .get();

    return products.map((e) { return e.toEntity(Category(name: '', id: categoryId)); }).toList();
  }

  @override
  Future<void> removeCategory(String id) async {
    if( _db == null){
      return;
    }
    await  _db?.transaction(() async {
      final category = await getCategory(id);
      final now = DateTime.now();

      await ( _db!.update( _db!.categoriesDrift)
        ..where((tbl) => tbl.id.equals(id)))
        .write(
          CategoriesDriftCompanion(
            deletedAt: Value(now),
            updatedAt: Value(now),
          ),
        );

      await ( _db!.update( _db!.categoriesDrift)
        ..where((tbl) => tbl.parentId.equals(id)))
        .write(
          CategoriesDriftCompanion(
            parentId: Value(category?.parentId),
            updatedAt: Value(now),
          ),
        );

      await ( _db!.update( _db!.productsDrift)
        ..where((tbl) => tbl.categoryId.equals(id)))
        .write(
          ProductsDriftCompanion(
            categoryId: Value(category?.parentId),
            updatedAt: Value(now),
          ),
        );
    });
  }

  @override
  Future<void> removeProduct(String id) async {
    if( _db == null){
      return;
    }
    await  _db?.transaction(() async {
      final now = DateTime.now();

      await ( _db!.update( _db!.productsDrift)
        ..where((tbl) => tbl.id.equals(id)))
        .write(
          ProductsDriftCompanion(
            deletedAt: Value(now),
            updatedAt: Value(now),
          ),
        );
    });
  }

  @override
  Future<void> removeCategoryWithChildren(String id) async {
    if( _db == null){
      return;
    }
    await  _db?.transaction(() async {
    final now = DateTime.now();

    await ( _db!.update( _db!.categoriesDrift)
      ..where((tbl) => tbl.id.equals(id) | tbl.parentId.equals(id)))
      .write(
        CategoriesDriftCompanion(
          deletedAt: Value(now),
          updatedAt: Value(now),
        ),
      );

    await ( _db!.update( _db!.productsDrift)
      ..where((tbl) => tbl.categoryId.equals(id)))
      .write(
        ProductsDriftCompanion(
          deletedAt: Value(now),
          updatedAt: Value(now),
        ),
      );
    });
  }

  @override
  Future<void> removeProducts(List<String> ids) async {
    if( _db == null){
      return;
    }
    await  _db?.transaction(() async {
      final now = DateTime.now();

      await ( _db!.update( _db!.productsDrift)
        ..where((tbl) => tbl.id.isIn(ids)))
        .write(
          ProductsDriftCompanion(
            deletedAt: Value(now),
            updatedAt: Value(now),
          ),
        );
    });
  }

  @override
  Future<Category?> updateCategory(Category category) async {
    if( _db == null){
      return null;
    }
    category = category.copyWith(updatedAt: DateTime.now());
    await  _db?.transaction(() async {
      final localCategory = await getCategory(category.id);
      if(localCategory == null){
        return;
      }

      await ( _db!.update( _db!.categoriesDrift)
        ..where((tbl) => tbl.id.equals(category.id)))
      .write( category.toCompanion() );
    });
    return category;
  }

  @override
  Future<Product?> updateProduct(Product product) async {
    if( _db == null){
      return null;
    }
    
    product = product.copyWith(updatedAt: DateTime.now());
    await  _db?.transaction(() async {
      final localProduct = await getProduct(product.id);
      if(localProduct == null){
        return;
      }

      await ( _db!.update( _db!.productsDrift)
        ..where((tbl) => tbl.id.equals(product.id)))
      .write( product.toCompanion() );
      await (_db!.delete(_db!.productsOptionsDrift)..where((tbl) => tbl.productId.equals(product.id))).go();
      if(product.options != null && product.options!.isNotEmpty){
          final listOption = product.options!.map((option) => 
            ProductsOptionsDriftCompanion(
              createdAt: Value(DateTime.now()),
              updatedAt: Value(DateTime.now()),
              optionId: Value(option.id),
              productId: Value(product.id),
            )
          ).toList();
          await  _db?.batch((batch) {
            batch.insertAll( _db!.productsOptionsDrift, listOption, mode: InsertMode.insertOrIgnore);
          });
      }
    });


    return product;
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

  @override
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