import 'package:pos_app/features/supplier/data/repositories/supplier_repository.dart';


class RemoveSupplier {
  RemoveSupplier(this._repository);

  final SupplierRepository _repository;

  Future<void> call(String id) {
    return _repository.removeSupplier(id);
  }
}