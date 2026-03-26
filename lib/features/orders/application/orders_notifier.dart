import 'package:flutter_riverpod/legacy.dart';
import 'package:pos_app/features/catalog/domain/entities/option_item.dart';
import 'package:pos_app/features/orders/application/orders_state.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';
import 'package:pos_app/features/orders/domain/entities/order_item.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';
import 'package:pos_app/features/orders/domain/enums/order_status.dart';

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

  /*void createDraft(String tableId) {
    print("ici1");
    final order = Order(
      id: UniqueKey().toString(),
      tableId: tableId,
      items: [],
      status: OrderStatus.draft,
      createdAt: DateTime.now(),
    );

    final updatedOrders = [...state.orders, order];

    state = OrdersState(
      orders: updatedOrders, 
      selectedOrderId: order.id
    );
  }*/

  void addProduct(Product product,
      {Map<String, List<OptionItem>>? options}) {
    /// récupérer la commande actuelle
    Order? order = state.selectedOrder;
    /// si aucune commande → créer une draft
    order ??= Order(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        items: [],
        createdAt: DateTime.now(),
      );
    final items = [...order.items];
    List<OptionItem> newOptions = [];
    if(options != null) {
      newOptions = options.values.expand((opt) => opt).toList();
    }
    /// vérifier si produit déjà dans la commande
    //final index =
      //  items.indexWhere((i) => i.productId == product.id && i.options == newOptions);
    final index =
        items.indexWhere((i) => i.productId == product.id && checkSameOption(i.options, newOptions));
    if (index != -1) {
      final existing = items[index];

      items[index] = existing.copyWith(
        quantity: existing.quantity + 1,
      );

    } else {
      items.add(
        OrderItem(
          productId: product.id,
          name: product.name,
          quantity: 1,
          unitPrice: product.price,
          options: newOptions,
        ),
      );
    }

    order = order.copyWith(items: items);
    final updatedOrders = [...state.orders, order];
    state = OrdersState(
      orders: updatedOrders, 
      selectedOrderId: order.id
    );

    _updateOrder(order);
  }

  void addProductO(Product product) {
    /// récupérer la commande actuelle
    Order? order = state.selectedOrder;
    /// si aucune commande → créer une draft
    order ??= Order(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        items: [],
        createdAt: DateTime.now(),
      );
    final items = [...order.items];

    /// vérifier si produit déjà dans la commande
    final index =
        items.indexWhere((i) => i.productId == product.id);

    if (index != -1) {
      final existing = items[index];

      items[index] = existing.copyWith(
        quantity: existing.quantity + 1,
      );

    } else {
      List<OptionItem> options = [];
      if(product.options != null) {
        options = product.options!.expand((opt) => opt.options).toList();
      }
      items.add(
        OrderItem(
          productId: product.id,
          name: product.name,
          quantity: 1,
          unitPrice: product.price,
          options: options,
        ),
      );
    }

    order = order.copyWith(items: items);
    final updatedOrders = [...state.orders, order];
    state = OrdersState(
      orders: updatedOrders, 
      selectedOrderId: order.id
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

  /*void addProduct(Product product) {
    final existing = state!.items
        .where((i) => i.productId == product.id)
        .toList();

    if (existing.isNotEmpty) {
      state = state!.copyWith(
        items: state!.items.map((i) {
          if (i.productId == product.id) {
            return i.copyWith(
                quantity: i.quantity + 1);
          }
          return i;
        }).toList(),
      );
    } else {
      state = state!.copyWith(
        items: [
          ...state!.items,
          OrderItem(
            productId: product.id,
            name: product.name,
            unitPrice: product.price,
            quantity: 1,
            options: [],
          )
        ],
      );
    }
  }*/

  void saveOrder() {
    Order? order = state.selectedOrder;
    order ??= order!.copyWith(
      status: OrderStatus.saved
    );
    //state = state!.copyWith(
      //  status: OrderStatus.saved);
  }

  void cancelOrder(String id) {
    state = state.copyWith(
      orders: state.orders.where((order) => order.id != id).toList(),
    );
  }

  void payOrder() {
    Order? order = state.selectedOrder;
    order ??= order!.copyWith(
      status: OrderStatus.paid
    );
    //state = state!.copyWith(
      //  status: OrderStatus.paid);
  }

  void increaseQuantity(OrderItem orderItem){
    orderItem.quantity++;
    //orderItem = orderItem.copyWith(quantity: orderItem.quantity +1);
  }

  void decreaseQuantity(OrderItem orderItem){
    orderItem.quantity--;
    //orderItem = orderItem.copyWith(quantity: orderItem.quantity - 1);
  }

  void addProductN(Product product, {Map<String, OptionItem>? options}) {
    /*Order? order = state.selectedOrder;

    if (order == null) {
      order = Order(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        items: [],
        createdAt: DateTime.now(),
      );
    }

    final items = [...order.items];

    final index = items.indexWhere((i) =>
        i.productId == product.id &&
        i.optionsKey() == optionsKey(options));

    if (index != -1) {
      final existing = items[index];
      items[index] = existing.copyWith(
        quantity: existing.quantity + 1,
      );
    } else {
      items.add(OrderItem(
        productId: product.id,
        name: product.name,
        quantity: 1,
        unitPrice: product.price +
            (options?.values.fold(0.0, (sum, o) => sum + o.price) ?? 0.0),
        options: options,
      ));
    }*/

    //state = state.copyWith(sele: order.copyWith(items: items));
  }

  /// Génère une clé unique pour comparer des options
  String optionsKey(Map<String, OptionItem>? options) {
    if (options == null || options.isEmpty) return "";
    return options.entries.map((e) => "${e.key}:${e.value.id}").join("-");
  }
  
  bool checkSameOption(List<OptionItem>? options, List<OptionItem> newOptions) {
    print("Option $options");
    print("newOptions $newOptions");
    return false;
  }
}