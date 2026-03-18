import 'package:pos_app/features/orders/domain/entities/order.dart';

class OrdersState{
  final List<Order> orders;
  final String? selectedOrderId;

  OrdersState({
    required this.orders,
    required this.selectedOrderId,
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
  }){
    return OrdersState(
      selectedOrderId: selectedOrderId ?? this.selectedOrderId, 
      orders: orders ?? this.orders);
  }
}