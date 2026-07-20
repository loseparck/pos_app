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
      return orders.firstWhere((order) => order.id == selectedOrderId);
    } catch(_){
      return null;
    }
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