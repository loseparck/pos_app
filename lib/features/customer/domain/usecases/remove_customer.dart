import 'package:pos_app/features/customer/data/repositories/customer_repository.dart';

class RemoveCustomer {
  RemoveCustomer(this._repository);

  final CustomerRepository _repository;

  Future<void> call(String id) {
    return _repository.removeCustomer(id);
  }
}