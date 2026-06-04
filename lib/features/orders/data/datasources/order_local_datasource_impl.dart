import 'package:drift/drift.dart';
import 'package:pos_app/data/local/db/app_database.dart';
import 'package:pos_app/features/orders/data/datasources/order_local_datasource.dart';
import 'package:pos_app/features/orders/data/mappers/order_mappers.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';
import 'package:pos_app/features/orders/domain/entities/order_item.dart';
import 'package:pos_app/features/orders/domain/entities/order_item_option.dart';
import 'package:pos_app/features/orders/domain/enums/order_status.dart';

class OrderLocalDatasourceImpl implements OrderLocalDatasource {
  OrderLocalDatasourceImpl(this._db);

  final AppDatabase? _db;

  @override
  Future<OrderItem?> addItem(OrderItem orderItem) async {
    if( _db == null){
      return null;
    }
    await _db?.transaction(() async {
      await _db?.into(_db!.orderItemDrift).insert(
        orderItem.toDrift(),
        onConflict: DoUpdate(
          (_) => orderItem.toDrift(),
          target: [ _db!.orderItemDrift.id],
        ),
      );
      //TODO refactore insert item
      for (final option in orderItem.options) {
        await  _db?.into( _db!.orderItemOptionsDrift).insert(
          option.toDrift(),
          onConflict: DoUpdate(
            (_) => option.toDrift(),
            target: [ _db!.orderItemOptionsDrift.id],
          ),
        );
      }

      await ( _db!.update( _db!.orderDrift)
        ..where((tbl) => tbl.id.equals(orderItem.orderId)))
        .write(
          OrderDriftCompanion(
            status: Value(OrderStatus.draft.name)
          )
        );

      return orderItem;
    });
    return orderItem;
  }

  @override
  Future<void> cancelOrder(String orderId) async{
    if( _db == null){
      return;
    }
    
    await  _db?.transaction(() async {
      final order = await getOrder(orderId);
      if(order == null){
        return;
      }
      
      await ( _db!.update( _db!.orderDrift)
        ..where((tbl) => tbl.id.equals(orderId)))
      .write(order.copyWith(status: OrderStatus.cancelled).toDrift(), );
    });
  }

  @override
  Future<Order?> createOrder(Order order) async {
    if( _db == null){
      return null;
    }
    await _db?.transaction(() async {
      await _db?.into(_db!.orderDrift).insert(
        order.toDrift(),
        onConflict: DoUpdate(
          (_) => order.toDrift(),
          target: [ _db!.orderDrift.id],
        ),
      );
      
      for (final item in order.items) {
        await addItem(item);
      }

      return order;
    });
    return order;
  }

  @override
  Future<void> decreaseItemQuantity(String orderItemId) async {
    if( _db == null){
      return;
    }
    
    await  _db?.transaction(() async {
      final orderItem = await getItem(orderItemId);
      if(orderItem == null){
        return;
      }
      if(orderItem.quantity > 1){
        await ( _db!.update( _db!.orderItemDrift)
          ..where((tbl) => tbl.id.equals(orderItemId)))
        .write( orderItem.copyWith(updatedAt: DateTime.now(), quantity: orderItem.quantity - 1).toDrift(), );
      } else if(orderItem.status == OrderStatus.draft){
        deleteItem(orderItemId);
      } else {
        cancelItem(orderItemId);
      }
      
    });
  }

  @override
  Future<void> deleteItem(String orderItemId) async {
    if( _db == null){
      return;
    }
    
    await  _db?.transaction(() async {
      final orderItem = await getItem(orderItemId);
      if(orderItem == null){
        return;
      }
      if(orderItem.status == OrderStatus.draft){
        await (_db!
          .delete(_db!.orderItemDrift)
          ..where((tbl) => tbl.id.equals(orderItemId))).go();
      } else {
        await ( _db!.update( _db!.orderItemDrift)
        ..where((tbl) => tbl.id.equals(orderItemId)))
        .write( OrderItemDriftCompanion(
            status: Value(OrderStatus.cancelled.name),
            deletedAt: Value(DateTime.now())
          )
        );
      }
    });
  }

  @override
  Future<void> cancelItem(String orderItemId) async {
    if( _db == null){
      return;
    }
    
    await  _db?.transaction(() async {
      final orderItem = await getItem(orderItemId);
      if(orderItem == null){
        return;
      }
      
      await ( _db!.update( _db!.orderItemDrift)
        ..where((tbl) => tbl.id.equals(orderItemId)))
      .write( orderItem.copyWith(status: OrderStatus.cancelled).toDrift(), );
    });
  }

  @override
  Future<void> deliverOrder(String orderId) async {
    if( _db == null){
      return;
    }
    
    await  _db?.transaction(() async {
      final order = await getOrder(orderId);
      if(order == null){
        return;
      }
      
      await ( _db!.update( _db!.orderDrift)
        ..where((tbl) => tbl.id.equals(orderId)))
      .write(order.copyWith(status: OrderStatus.delivred).toDrift(), );
    });
  }

  @override
  Future<OrderItem?> getItem(String orderItemId) async {
    if( _db == null){
      return null;
    }
    late final OrderItem orderItem;
    await _db?.transaction(() async {
      final orderItemDb = await ( _db!.select( _db!.orderItemDrift)
          ..where((tbl) => tbl.id.equals(orderItemId)))
        .getSingleOrNull();
      if(orderItemDb != null){
        orderItem = orderItemDb.toEntity(options: await getItemOptions(orderItemDb.id));
      }
    });
    return orderItem;
  }

  @override
  Future<List<OrderItem>> getItems(String orderId) async {
    if( _db == null){
      return [];
    }
    List<OrderItem> result = [];
    await _db?.transaction(() async {
      final query = _db!.select(_db!.orderItemDrift).join([
        leftOuterJoin(
          _db!.orderItemOptionsDrift,
          _db!.orderItemOptionsDrift.orderItemId.equalsExp(_db!.orderItemDrift.id),
        ),
      ])
        ..where(_db!.orderItemDrift.orderId.equals(orderId));

      final rows = await query.get();

      final itemMap = <String, OrderItem>{};
      final optionsMap = <String, List<OrderItemOption>>{};

      for (final row in rows) {
        final itemRow = row.readTable(_db!.orderItemDrift);

        itemMap.putIfAbsent(
          itemRow.id,
          () => itemRow.toEntity(),
        );

        final optionRow = row.readTableOrNull(_db!.orderItemOptionsDrift);

        if (optionRow != null) {
          optionsMap
              .putIfAbsent(itemRow.id, () => [])
              .add(optionRow.toEntity());
        }
      }

      result = itemMap.values.map((item) {
        return item.copyWith(
          options: optionsMap[item.id] ?? const [],
        );
      }).toList();
      return result;
    });
    return result;
  }

  Future<List<OrderItem>> getActiveItems(String orderId) async {
    if( _db == null){
      return [];
    }
    List<OrderItem> result = [];
    await _db?.transaction(() async {
      final option = await _db!.select(_db!.orderItemOptionsDrift).get();
      print("*************************************");
      for(final op in option)
      {
        print("++++++ option: $op");
      }
      print("*************************************");
      final query = _db!.select(_db!.orderItemDrift).join([
        leftOuterJoin(
          _db!.orderItemOptionsDrift,
          _db!.orderItemOptionsDrift.orderItemId.equalsExp(_db!.orderItemDrift.id),
        ),
      ])
        ..where(_db!.orderItemDrift.orderId.equals(orderId) & _db!.orderItemDrift.status.isNotIn([OrderStatus.cancelled.name]));

      final rows = await query.get();

      final itemMap = <String, OrderItem>{};
      final optionsMap = <String, List<OrderItemOption>>{};
      print("-------------------------------------");
      for (final row in rows) {
        final itemRow = row.readTable(_db!.orderItemDrift);
        
        itemMap.putIfAbsent(
          itemRow.id,
          () => itemRow.toEntity(),
        );

        final optionRow = row.readTableOrNull(_db!.orderItemOptionsDrift);
        print("++++++++++ itemRow $itemRow");
        print("++++++++++ optionRow $optionRow");
        if (optionRow != null) {
          optionsMap
              .putIfAbsent(itemRow.id, () => [])
              .add(optionRow.toEntity());
        }
      }
      print("-------------------------------------");

      result = itemMap.values.map((item) {
        return item.copyWith(
          options: optionsMap[item.id] ?? const [],
        );
      }).toList();
      return result;
    });
    return result;
  }

  @override
  Future<List<OrderItemOption>> getItemOptions(String orderItemId) async {
    if( _db == null){
      return [];
    }
    final options = await ( _db!.select( _db!.orderItemOptionsDrift)
          ..where((tbl) => tbl.orderItemId.equals(orderItemId)))
        .get();
    return options.map((e) { return e.toEntity(); }).toList();
  }

  @override
  Future<Order?> getOrder(String orderId) async {
    if( _db == null){
      return null;
    }
    late final Order order;
    await _db?.transaction(() async {
      final orderDb = await ( _db!.select( _db!.orderDrift)
          ..where((tbl) => tbl.id.equals(orderId)))
        .getSingleOrNull();
      if(orderDb != null){
        order = orderDb.toEntity(items: await getItems(orderDb.id));
      }
    });
    return order;
  }

  @override
  Future<List<Order>> getOrders() async {
    if( _db == null){
      return [];
    }
    final orders = await ( _db!.select( _db!.orderDrift))
        .get();
    return Future.wait(orders.map((e) async { return e.toEntity(items: await getItems(e.id)); }).toList());
  }

  @override
  Future<List<Order>> getActiveOrders() async {
    if( _db == null){
      return [];
    }
    final orders = await ( _db!.select( _db!.orderDrift)
          ..where((tbl) => 
          tbl.status.isIn([
            OrderStatus.delivred.name,
            OrderStatus.validated.name,
            OrderStatus.draft.name,
            OrderStatus.waitingValidation.name
            ])))
        .get();
    return Future.wait(orders.map((e) async { return e.toEntity(items: await getActiveItems(e.id)); }).toList());
  }

  @override
  Future<void> increaseItemQuantity(String orderItemId) async{
    if( _db == null){
      return;
    }
    
    await  _db?.transaction(() async {
      final orderItem = await getItem(orderItemId);
      if(orderItem == null){
        return;
      }
      await ( _db!.update( _db!.orderItemDrift)
        ..where((tbl) => tbl.id.equals(orderItemId)))
      .write( orderItem.copyWith(updatedAt: DateTime.now(), quantity: orderItem.quantity + 1).toDrift(), );
    });
  }

  @override
  Future<void> payOrder(String orderId) async {
    if( _db == null){
      return;
    }
    
    await  _db?.transaction(() async {
      final order = await getOrder(orderId);
      if(order == null){
        return;
      }
      
      await ( _db!.update( _db!.orderDrift)
        ..where((tbl) => tbl.id.equals(orderId)))
      .write(order.copyWith(status: OrderStatus.paid).toDrift(), );
    });
  }

  @override
  Future<void> validateOrder(String orderId) async {
    if( _db == null){
      return;
    }
    
    await  _db?.transaction(() async {
      final order = await getOrder(orderId);
      if(order == null){
        return;
      }
      
      if(order.status == OrderStatus.draft){
        await ( _db!.update( _db!.orderDrift)
          ..where((tbl) => tbl.id.equals(orderId)))
        .write(
          OrderDriftCompanion(
            status: Value(OrderStatus.validated.name),
            validatedAt: Value(DateTime.now())
          )
        );

        await ( _db!.update( _db!.orderItemDrift)
        ..where((tbl) => tbl.orderId.equals(orderId) & tbl.status.equals(OrderStatus.draft.name)))
        .write(OrderItemDriftCompanion(
          status: Value(OrderStatus.validated.name),
          validatedAt: Value(DateTime.now())
        ));
      }
    });
  }
  
}