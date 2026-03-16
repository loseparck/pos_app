import 'package:pos_app/core/network/connectivity_service.dart';
import 'package:pos_app/features/orders/data/datasources/order_local_datasource.dart';
import 'package:pos_app/features/orders/data/datasources/order_remote_datasource.dart';
import 'package:pos_app/features/orders/data/models/order_model.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';

abstract class OrderRepository {
  Future<void> createOrder(Order order);
  Future<List<Order>> getOrders();
  Future<void> syncOrders();
}

class OrderRepositoryImpl implements OrderRepository{

  final OrderLocalDatasource local;
  final OrderRemoteDatasource remote;
  final ConnectivityService connectivity;

  OrderRepositoryImpl(
    this.local, 
    this.remote, 
    this.connectivity
  );
    
  @override
  Future<void> createOrder(Order order) async {
    final model = OrderModel(
      id: order.id,
      items: order.items.cast(), 
      createdAt: order.createdAt, 
      synced: order.synced
    );

    await local.saveOrder(model);

    if(await connectivity.isOnline()){
      await remote.sendOrder(model);
      await local.markAsSynced(model.id);
    }
  }
    
  @override
  Future<List<Order>> getOrders() {
    return local.getUnsyncedOrders();
  }

  @override
  Future<void> syncOrders() async {
    final unsynced = await local.getUnsyncedOrders();
    for(final order in unsynced){
      await remote.sendOrder(order);
      await local.markAsSynced(order.id);
    }
  }
  
}