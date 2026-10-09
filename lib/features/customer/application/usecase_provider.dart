import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/customer/data/repositories/customer_repository_provider.dart';
import 'package:pos_app/features/customer/domain/usecases/remove_customer.dart';
import 'package:pos_app/features/customer/domain/usecases/save_customer.dart';
import 'package:pos_app/features/customer/domain/usecases/update_customer.dart';


final saveCustomerUseCaseProvider = Provider<SaveCustomer>((ref) {
  return SaveCustomer(ref.read(customerRepositoryProvider));
});

final removeCustomerUseCaseProvider = Provider<RemoveCustomer>((ref) {
  return RemoveCustomer(ref.read(customerRepositoryProvider));
});

final updateCustomerUseCaseProvider = Provider<UpdateCustomer>((ref) {
  return UpdateCustomer(ref.read(customerRepositoryProvider));
});
