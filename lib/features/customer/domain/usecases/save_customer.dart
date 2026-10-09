
import 'package:pos_app/features/customer/data/repositories/customer_repository.dart';
import 'package:pos_app/features/customer/domain/entities/customer.dart';

class SaveCustomer {
  SaveCustomer(this._repository);

  final CustomerRepository _repository;

  Future<Customer> call(Customer customer) {
    return _repository.saveCustomer(customer);
  }
}