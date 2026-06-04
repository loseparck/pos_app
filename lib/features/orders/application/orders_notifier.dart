import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/catalog/domain/entities/item.dart';
import 'package:pos_app/features/orders/application/orders_state.dart';
import 'package:pos_app/features/orders/application/usecase_provider.dart';
import 'package:pos_app/features/orders/data/repositories/order_repository.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';
import 'package:pos_app/features/orders/domain/entities/order_item.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';
import 'package:pos_app/features/orders/domain/entities/order_item_option.dart';
import 'package:pos_app/features/orders/domain/enums/order_status.dart';
import 'package:collection/collection.dart';
import 'package:uuid/uuid.dart';

class OrdersNotifier extends StateNotifier<OrdersState> {
  final Ref ref;
  final OrderRepository _repository;

  OrdersNotifier(this.ref, this._repository) : 
    super(
      OrdersState(
        orders: [], 
        selectedOrderId: null
      )
    );
  
  Future<void> load() async {
    final orders = await _repository.getActiveOrders();
    state = state.copyWith(
      orders: orders
    );
  } 

  OrderItem convertProductToOrderItem(Product p, List<Item> options, String orderId, {String? comment}){
    String orderItemId = Uuid().v4();
    return OrderItem(
      id: orderItemId,
      productId: p.id,
      productName: p.name,
      quantity: 1,
      unitPrice: p.price,
      orderId: orderId,
      comment: comment,
      vat: p.vat,
      status: OrderStatus.draft,
      options: mergeOptions(options.map((option) => convertItemToOrderItemOption(option, orderItemId)).toList())
    );
  }

  List<OrderItemOption> mergeOptions(List<OrderItemOption> options) {
    final grouped = <String, OrderItemOption>{};

    for (final option in options) {
      if (grouped.containsKey(option.optionId)) {
        final existing = grouped[option.optionId]!;

        grouped[option.optionId ?? ''] = existing.copyWith(
          quantity: existing.quantity + option.quantity,
        );
      } else {
        grouped[option.optionId ?? ''] = option;
      }
    }

    return grouped.values.toList();
  }

  OrderItemOption convertItemToOrderItemOption(Item item, String orderItem){
    return OrderItemOption(
      id: Uuid().v4(),
      optionId: item.id,
      optionName: item.name,
      quantity: 1,
      unitPrice: item.price,
      vat: item.vat,
      orderItemId: orderItem
    );
  }
  
  void addProduct(Product product, Map<String, List<Item>> options,
      ) async {

    /// récupérer la commande actuelle
    Order? order = state.selectedOrder;

    if(order != null){
      final orderItem = convertProductToOrderItem(product, options.values.expand((items) => items).toList(), order.id);
      bool found = false;
      for(final item in order.items){
        if(item.productId == orderItem.productId && item.status == OrderStatus.draft){
          if(checkSameOption(item.options, orderItem.options)){
            final increaseItemUseCase = ref.read(increaseItemUseCaseProvider);
            increaseItemUseCase(item.id);
            state = state.copyWith(
              orders: state.orders.map((elem) {
                if(elem.id != order.id){
                  return elem;
                }else{
                  return order.copyWith(
                    status: OrderStatus.draft,
                    items: elem.items.map((tbl){
                      if(tbl.id == item.id){
                        return item.copyWith(quantity: item.quantity + 1);
                      } else {
                        return tbl;
                      }
                    }).toList(),
                  );
                }
              }).toList(),
            );
            found = true;
          }
        }
      }

      if(!found){
        final addItemUseCase = ref.read(addItemUseCaseProvider);
        final savedOrderItem = await addItemUseCase(orderItem);
        state = state.copyWith(
          orders: state.orders.map((elem) {
            if(elem.id != order.id){
              return elem;
            }else{
              return order.copyWith(
                status: OrderStatus.draft,
                items: [...elem.items, savedOrderItem]
              );
            }
          }).toList(),
        );
      }
    } else {
      final String orderId = Uuid().v4();
      final orderDraft = Order(
        id: orderId,
        tableId: state.tableId,
        groupId: state.groupId,
        status: OrderStatus.draft,
        items: [convertProductToOrderItem(product, options.values.expand((items) => items).toList(), orderId)]
      );
      final createOrderUseCase = ref.read(createOrderUseCaseProvider);
      final order = await createOrderUseCase(orderDraft);
      state = state.copyWith(
        selectedOrderId: order.id,
        orders: [...state.orders, order],
      );
    }
/*
    final items = [...order!.items];
    List<Item> newOptions = [];
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
          productName: product.name,
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

    _updateOrder(order);*/
  }

  bool checkSameOption(
    List<OrderItemOption>? options,
    List<OrderItemOption> newOptions,
  ) {
    if (options == null) return false;

    const eq = UnorderedIterableEquality();

    return eq.equals(
      newOptions.map((e) => (e.optionId, e.quantity)),
      options.map((e) => (e.optionId, e.quantity)),
    );
  }

  void setTableAndGroupId({String? tableId, String? groupId}) {
    final selectedOrderId = state.orders.where((order) => order.tableId == tableId || order.groupId == groupId).firstOrNull?.id ?? null;
    state = state.copyWith(
      selectedOrderId: selectedOrderId,
      tableId: tableId,
      groupId: groupId,
      resetGroupId: groupId == null,
      resetTableId: tableId == null,
      resetSelectedOrderId: selectedOrderId == null,
    );
  }

  void updateItemQte(String orderItemId, String orderId, int qte){
    state = state.copyWith(
      orders: state.orders.map((order){
        if(order.id != orderId){
          return order;
        } else {
          return order.copyWith(
            items: order.items.map((item) {
              if(item.id != orderItemId){
                return item;
              } else {
                return item.copyWith(quantity: item.quantity + qte);
              }
            }).toList(),
          );
        }
      }).toList()
    );
  }

  void increaseQuantity(String orderItemId, String orderId){
    final increaseItemUseCase = ref.read(increaseItemUseCaseProvider);
    increaseItemUseCase(orderItemId);
    updateItemQte(orderItemId, orderId, 1);
  }

  void decreaseQuantity(String orderItemId, String orderId){
    final decreaseItemUseCase = ref.read(decreaseItemUseCaseProvider);
    decreaseItemUseCase(orderItemId);
    updateItemQte(orderItemId, orderId, -1);
  }

  void removeItem(String orderItemId, String orderId){
    final removeItemUseCase = ref.read(removeItemUseCaseProvider);
    removeItemUseCase(orderItemId);
    state = state.copyWith(
      orders: state.orders.map((order){
        if(order.id != orderId){
          return order;
        } else {
          return order.copyWith(
            items: order.items.whereNot((item) => item.id == orderItemId).toList()
          );
        }
      }).toList()
    );
  }

  void saveOrder() {
    if(state.selectedOrderId != null && state.selectedOrderId != "-1"){
      final validateOrderUseCase = ref.read(validateOrderUseCaseProvider);
      validateOrderUseCase(state.selectedOrderId ?? '');
      Order? updatedOrder = state.selectedOrder;

      updatedOrder = updatedOrder?.copyWith(
        items: updatedOrder.items.map((item) {
          if(item.status == OrderStatus.draft){
            return item.copyWith(status: OrderStatus.validated, validatedAt: DateTime.now());
          } else {
            return item;
          }
        }).toList(),
        status: OrderStatus.validated
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
/*
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
      {Map<String, List<Item>>? options, String? supportId, bool? isTable}) {
    /// récupérer la commande actuelle
    Order? order = state.selectedOrder;

    final items = [...order!.items];
    List<Item> newOptions = [];
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
          productName: product.name,
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
            return item.copyWith(status: OrderStatus.validated, validatedAt: DateTime.now());
          } else {
            return item;
          }
        }).toList(),
        status: OrderStatus.validated
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

  bool checkSameOption(List<Item>? options, List<Item> newOptions) {
    final eq = const UnorderedIterableEquality();
    if(eq.equals(newOptions.map((e) => e.id),options!.map((e) => e.id))){
      return true;
    }
    return false;
  }
*/
}