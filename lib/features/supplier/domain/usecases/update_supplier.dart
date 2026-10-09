
import 'package:pos_app/features/supplier/data/repositories/supplier_repository.dart';
import 'package:pos_app/features/supplier/domain/entities/supplier.dart';

class UpdateSupplier {
  UpdateSupplier(this._repository);

  final SupplierRepository _repository;

  Future<Supplier> call(Supplier supplier) {
    return _repository.updateSupplier(supplier);
  }
}