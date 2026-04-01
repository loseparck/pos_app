import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:pos_app/features/catalog/domain/entities/option_item.dart';
import 'package:pos_app/features/orders/application/orders_state.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';
import 'package:pos_app/features/orders/domain/entities/order_item.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';
import 'package:pos_app/features/orders/domain/entities/payment.dart';
import 'package:pos_app/features/orders/domain/enums/order_status.dart';
import 'package:collection/collection.dart';

final ordersProvider =
    StateNotifierProvider<OrdersNotifier, OrdersState?>(
        (ref) => OrdersNotifier());

class OrdersNotifier extends StateNotifier<OrdersState> {
  
  OrdersNotifier() : 
    super(
      OrdersState(
        orders: [], 
        selectedOrderId: null
      )
    );

  void initSelectedOrderByTableOrGroupId(String id, bool isTable) {
      String? orderId = "-1";
      for(Order order in state.orders){
        if(((isTable && order.tableId == id) || ( !isTable && order.groupId == id))  && order.status != OrderStatus.paid) {
          orderId = order.id;
        }
      }
      
      if(orderId == "-1"){
        Order? order = Order(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                items: [],
                createdAt: DateTime.now(),
                tableId: isTable ? id : null,
                groupId: !isTable ? id : null
              );
        final updatedOrders = [...state.orders, order];
        state = OrdersState(
          orders: updatedOrders, 
          selectedOrderId: order.id
        );
      } else {
        state = state.copyWith(
          selectedOrderId: orderId
        );
      }
  }

  void addProduct(Product product,
      {Map<String, List<OptionItem>>? options, String? supportId, bool? isTable}) {
    /// récupérer la commande actuelle
    Order? order = state.selectedOrder;

    final items = [...order!.items];
    List<OptionItem> newOptions = [];
    if(options != null) {
      newOptions = options.values.expand((opt) => opt).toList();
    }
    /// vérifier si produit déjà dans la commande
    final index =
        items.indexWhere((i) => i.productId == product.id && i.status == OrderStatus.draft && checkSameOption(i.options, newOptions));
    if (index != -1) {
      final existing = items[index];
      items[index] = existing.copyWith(
        quantity: existing.quantity + 1,
      );

    } else {
      items.add(
        OrderItem(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          productId: product.id,
          name: product.name,
          quantity: 1,
          unitPrice: product.price,
          options: newOptions,
          createdAt: DateTime.now(),
          status: OrderStatus.draft
        ),
      );
    }

    order = order.copyWith(items: items, status: OrderStatus.draft);

    state = state.copyWith(
      orders: state.orders.map((o) {
        if(o.id == order?.id){
          return order ?? o;
        }else {
          return o;
        }
      }).toList(),
    );

    _updateOrder(order);
  }

  bool checkIfProductExist(List<OrderItem> items, OrderItem item){

    return false;
  }
  
  void _updateOrder(Order order){
    final orderGroups = state.orders
      .map((g) => g.id == order.id ? order : g).toList();
    
    state = OrdersState(
      orders: orderGroups, 
      selectedOrderId: order.id
    );
  }

  void saveOrder() {
    if(state.selectedOrderId != null && state.selectedOrderId != "-1"){
      Order? updatedOrder = state.selectedOrder;

      updatedOrder = updatedOrder?.copyWith(
        items: updatedOrder.items.map((item) {
          if(item.status == OrderStatus.draft){
            return item.copyWith(status: OrderStatus.saved, validatedAt: DateTime.now());
          } else {
            return item;
          }
        }).toList(),
        status: OrderStatus.saved
      );

      state = state.copyWith(
        orders: state.orders.map((order) {
          if(order.id == updatedOrder?.id){
            return updatedOrder ?? order;
          }else {
            return order;
          }
        }).toList(),
      );
    }
  }

  void cancelOrder(BuildContext context) {
    state = state.copyWith(
      orders: state.orders.where((order) => order.id != state.selectedOrderId).toList(),
    );
    Navigator.pop(context);
  }

  void payOrder(Payment payment) {
    Order? order = state.selectedOrder;
    
    order = order?.copyWith(
      status: OrderStatus.paid,
      payment: payment,
    );

    state = state.copyWith(
      orders: state.orders.map((o) {
        if(o.id == order?.id){
          return order ?? o;
        }else {
          return o;
        }
      }).toList(),
      selectedOrderId: state.selectedOrderId
    );
  }

  void increaseQuantity(OrderItem orderItem){
    orderItem.quantity++;
    //orderItem = orderItem.copyWith(quantity: orderItem.quantity +1);
  }

  void decreaseQuantity(OrderItem orderItem){
    orderItem.quantity--;
  }

  bool checkSameOption(List<OptionItem>? options, List<OptionItem> newOptions) {
    final eq = const UnorderedIterableEquality();
    if(eq.equals(newOptions.map((e) => e.id),options!.map((e) => e.id))){
      return true;
    }
    return false;
  }
}