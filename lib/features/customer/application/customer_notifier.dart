import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/customer/application/customer_state.dart';
import 'package:pos_app/features/customer/data/repositories/customer_repository.dart';
import 'package:pos_app/features/customer/domain/entities/customer.dart';
import 'usecase_provider.dart';

class CustomerNotifier extends StateNotifier<CustomerState> {
  final Ref ref;
  final CustomerRepository _repository;

  CustomerNotifier(this.ref, this._repository) : 
    super(
      CustomerState(
        customers: []
      )
    );


  Future<void> load() async {
    final customers = await _repository.getCustomers();
    state = state.copyWith(
      customers: customers
    );
  } 

  Future<Customer?> addCustomer(Customer customer) async {
    try {
      final saveCustomerUseCase = ref.read(saveCustomerUseCaseProvider);
      final newCustomer = await saveCustomerUseCase(customer);
      state = state.copyWith(
        customers: [...state.customers, newCustomer],
      );
      return newCustomer;
    } catch (e) {
      if (kDebugMode) {
        print("Error ${e.toString()}");
      }
      return null;
    }
  }

  Future<void> updateCustomer(Customer customer) async {
    final updateCustomerUseCase = ref.read(updateCustomerUseCaseProvider);
    updateCustomerUseCase(customer);
      
    state = state.copyWith(
      customers: state.customers.map((elem) => elem.id != customer.id ? elem: customer).toList(),
    );
  }

  /*Future<void> toggleCustomer(String customerId, bool newState) async {
      final changeCustomerStateUseCase = ref.read(changeCustomerStateUseCaseProvider);
      changeCustomerStateUseCase(customerId, newState);
       
      state = state.copyWith(
        customers: state.customers.map((elem) => elem.id != customerId ? elem: elem.copyWith(isActive: newState)).toList(),
      );
  }*/

  Future<void> removeCustomer(String id) async {
      final removeCustomerUseCase = ref.read(removeCustomerUseCaseProvider);
      removeCustomerUseCase(id);
      state = state.copyWith(
        customers: state.customers.where((item) => item.id != id).toList(),
      );
  }

}