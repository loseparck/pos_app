import 'package:pos_app/features/customer/data/models/dto/create_customer_dto.dart';
import 'package:pos_app/features/customer/data/models/dto/update_customer_dto.dart';
import 'package:pos_app/features/customer/domain/entities/customer.dart';

abstract class CustomerRemoteDatasource {
  Future<Customer> saveCustomer(CreateCustomerDto customer);
  Future<List<Customer>> getCustomers();
  Future<Customer?> getCustomer(String id);
  Future<void> removeCustomer(String id);
  Future<Customer> updateCustomer(UpdateCustomerDto customer, String discountId);
  Future<Customer> changeCustomerState(String customerId, bool state);
}