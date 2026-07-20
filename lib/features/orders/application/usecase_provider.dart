import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/orders/data/repositories/order_repository_provider.dart';
import 'package:pos_app/features/orders/domain/usecases/add_item.dart';
import 'package:pos_app/features/orders/domain/usecases/cancel_order.dart';
import 'package:pos_app/features/orders/domain/usecases/change_order_status.dart';
import 'package:pos_app/features/orders/domain/usecases/create_order.dart';
import 'package:pos_app/features/orders/domain/usecases/decrease_item.dart';
import 'package:pos_app/features/orders/domain/usecases/increase_item.dart';
import 'package:pos_app/features/orders/domain/usecases/pay_order.dart';
import 'package:pos_app/features/orders/domain/usecases/remove_item.dart';
import 'package:pos_app/features/orders/domain/usecases/validate_order.dart';

final createOrderUseCaseProvider = Provider<CreateOrder>((ref) {
  return CreateOrder(ref.read(orderRepositoryProvider));
});

final cancelOrderUseCaseProvider = Provider<CancelOrder>((ref) {
  return CancelOrder(ref.read(orderRepositoryProvider));
});

final payOrderUseCaseProvider = Provider<PayOrder>((ref) {
  return PayOrder(ref.read(orderRepositoryProvider));
});

final addItemUseCaseProvider = Provider<AddItem>((ref) {
  return AddItem(ref.read(orderRepositoryProvider));
});

final increaseItemUseCaseProvider = Provider<IncreaseItem>((ref) {
  return IncreaseItem(ref.read(orderRepositoryProvider));
});

final decreaseItemUseCaseProvider = Provider<DecreaseItem>((ref) {
  return DecreaseItem(ref.read(orderRepositoryProvider));
});

final removeItemUseCaseProvider = Provider<RemoveItem>((ref) {
  return RemoveItem(ref.read(orderRepositoryProvider));
});

final validateOrderUseCaseProvider = Provider<ValidateOrder>((ref) {
  return ValidateOrder(ref.read(orderRepositoryProvider));
});

final updateOrderStatusUseCaseProvider = Provider<ValidateOrder>((ref) {
  return ValidateOrder(ref.read(orderRepositoryProvider));
});

final changeOrderStatusUseCaseProvider = Provider<ChangeOrderStatus>((ref) {
  return ChangeOrderStatus(ref.read(orderRepositoryProvider));
});