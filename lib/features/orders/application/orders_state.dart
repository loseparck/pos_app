import 'package:pos_app/features/orders/domain/entities/order.dart';

class OrdersState{
  final List<Order> orders;
  final String? selectedOrderId;
  final String? tableId;
  final String? groupId;

  OrdersState({
    required this.orders,
    this.selectedOrderId,
    this.tableId,
    this.groupId,
  });

  Order? get selectedOrder {
    if(selectedOrderId == null) return null;
    try{
      return orders.where((o) => o.id == selectedOrderId).firstOrNull;
    } catch(_){
      return null;
    }
  }

  Order? getOrderByTable(String tableId) {
      return orders.where((o) => o.tableId == tableId).firstOrNull;
  }

  Order? getOrderById(String orderId) {
      return orders.where((o) => o.id == orderId).firstOrNull;
  }

  OrdersState copyWith({
    List<Order>? orders,
    String? selectedOrderId,
    String? tableId,
    String? groupId,
    bool? resetGroupId,
    bool? resetTableId,
    bool? resetSelectedOrderId,
  }){
    return OrdersState(
      orders: orders ?? this.orders,
      selectedOrderId: resetSelectedOrderId == true ? null : selectedOrderId ?? this.selectedOrderId,
      tableId: resetTableId == true ? null : tableId ?? this.tableId,
      groupId: resetGroupId == true ? null : groupId ?? this.groupId, 
    );
  }
}