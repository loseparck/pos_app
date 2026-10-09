import 'package:pos_app/features/customer/domain/entities/customer.dart';

abstract class CustomerRepository {
  Future<Customer> saveCustomer(Customer customer);
  Future<List<Customer>> getCustomers();
  Future<Customer?> getCustomer(String id);
  Future<void> removeCustomer(String id);
  Future<Customer> updateCustomer(Customer customer);
  Future<Customer?> changeCustomerState(String customerId, bool state);
}