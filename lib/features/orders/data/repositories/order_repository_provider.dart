import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/app/providers.dart';
import 'package:pos_app/core/network/connectivity_service.dart';
import 'package:pos_app/core/network/dio_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:pos_app/features/catalog/data/repositories/product_repository_provider.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';
import 'package:pos_app/features/orders/application/option_selection_notifier.dart';
import 'package:pos_app/features/orders/application/option_selection_provider.dart';
import 'package:pos_app/features/orders/application/orders_notifier.dart';
import 'package:pos_app/features/orders/application/orders_state.dart';
import 'package:pos_app/features/orders/application/pos_notifier.dart';
import 'package:pos_app/features/orders/application/pos_state.dart';
import 'package:pos_app/features/orders/data/datasources/order_local_datasource.dart';
import 'package:pos_app/features/orders/data/datasources/order_local_datasource_impl.dart';
import 'package:pos_app/features/orders/data/datasources/order_remote_datasource.dart';
import 'package:pos_app/features/orders/data/datasources/order_remote_datasource_impl.dart';
import 'package:pos_app/features/orders/data/models/order_extension.dart';
import 'package:pos_app/features/orders/data/models/order_summary_data.dart';
import 'package:pos_app/features/orders/data/repositories/order_repository.dart';
import 'package:pos_app/features/orders/data/repositories/order_repository_impl.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';
import 'package:pos_app/features/orders/domain/entities/order_item.dart';

final orderRemoteDataSourceProvider = Provider<OrderRemoteDatasource>((ref) {
  return OrderRemoteDatasourceImpl(
    ref.read(dioProvider),
  );
});

final orderLocalDataSourceProvider = Provider<OrderLocalDatasource>((ref) {
  if (kIsWeb) {
     return OrderLocalDatasourceImpl(
      null
    );
  }

  //return ProductRepositoryDrift(db);
  return OrderLocalDatasourceImpl(
    ref.watch(appDatabaseProvider)
  );
});

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  return OrderRepositoryImpl(
    ref.read(orderLocalDataSourceProvider),
    ref.read(orderRemoteDataSourceProvider),
    ConnectivityService(
      Connectivity(),
      ref.read(dioProvider)
    )
  );
});

final ordersProvider = StateNotifierProvider<OrdersNotifier, OrdersState>( (ref) {
  return OrdersNotifier(ref, ref.read(orderRepositoryProvider));
} );


final posProvider =
    StateNotifierProvider<PosNotifier, PosState>(
  (ref) => PosNotifier(),
);

final productSearchProvider =
  StateProvider<String>((ref) => '');

final selectedCategoryProvider =
  StateProvider<String?>((ref) => null);

final keypadQuantityProvider =
  StateProvider<int>((ref) => 1);

final currentDiscountProvider =
  StateProvider<double>((ref) => 0);

final selectedOrderItemProvider = Provider<OrderItem?>((ref) {
  final order = ref.watch(selectedOrderProvider);

  final selectedItemId =
      ref.watch(posProvider.select((e) => e.selectedOrderItemId));

  if (order == null) return null;

  return order.items
      .where((item) => item.id == selectedItemId)
      .firstOrNull;
});

final filteredProductsProvider =
    Provider<List<Product>>((ref) {

  final products =
      ref.watch(productsProvider).products;

  final ui =
      ref.watch(posProvider);
  return products.where((product) {

    final matchCategory =
        ui.selectedCategoryId == null ||
        product.category?.id == ui.selectedCategoryId;

    final matchSearch =
        ui.search.isEmpty
        || product.name
            .toLowerCase()
            .contains(ui.search.toLowerCase())
        || (product.barcode != null && product.barcode!
            .toLowerCase()
            .contains(ui.search.toLowerCase()))
        || (product.sku != null && product.sku!
            .toLowerCase()
            .contains(ui.search.toLowerCase()));

    return matchCategory && matchSearch;

  }).toList();
});

final orderSummaryProvider = Provider<OrderSummaryData?>((ref) {
  final order = ref.watch(selectedOrderProvider);

  if (order == null) return null;

  int quantity = 0;

  double subtotal = 0;

  double vat = 0;

  for (final item in order.items) {
    quantity += item.quantity;

    subtotal += item.unitPrice * item.quantity;

    vat += item.unitPrice *
        item.quantity *
        item.vat /
        100;

    for (final option in item.options) {
      subtotal += option.unitPrice * option.quantity;

      vat += option.unitPrice *
          option.quantity *
          option.vat /
          100;
    }
  }

  return OrderSummaryData(
    quantity: quantity,
    subtotal: subtotal,
    vat: vat,
    total: subtotal + vat,
  );
});

final selectedOrderProvider = Provider<Order?>((ref) {
  return ref.watch(ordersProvider.select(
    (state) => state.selectedOrder,
  ));
});

final selectedOrderItemIdProvider =
    StateProvider<String?>((ref) => null);

final selectedOrderItemsProvider =
    Provider<List<OrderItem>>((ref) {

  final order = ref.watch(selectedOrderProvider);

  return order?.items ?? const [];
});

final orderItemProvider =
    Provider.family<OrderItem?, String>((ref, itemId) {
  final order = ref.watch(selectedOrderProvider);

  if (order == null) {
    return null;
  }

  try {
    return order.items.firstWhere((item) => item.id == itemId);
  } catch (_) {
    return null;
  }
});

final orderItemsProvider =
    Provider<List<OrderItem>>((ref) {
  final order = ref.watch(selectedOrderProvider);

  if (order == null) {
    return [];
  }

  try {
    return order.items;
  } catch (_) {
    return [];
  }
});

final optionSelectionProvider =
    StateNotifierProvider<
        OptionSelectionNotifier,
        OptionSelectionState>(
  (ref) {
    return OptionSelectionNotifier();
  },
);

final orderTotalProvider = Provider<double>((ref) {
  return ref.watch(selectedOrderProvider)?.total ?? 0;
});

final orderVatProvider = Provider<double>((ref) {
  return ref.watch(selectedOrderProvider)?.vat ?? 0;
});

final orderSubtotalProvider = Provider<double>((ref) {
  return ref.watch(orderTotalProvider) - ref.watch(orderVatProvider);
});

final orderQuantityProvider = Provider<int>((ref) {
  return ref.watch(selectedOrderProvider)?.quantity ?? 0;
});