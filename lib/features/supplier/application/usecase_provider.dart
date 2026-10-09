import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/supplier/data/repositories/supplier_repository_provider.dart';
import 'package:pos_app/features/supplier/domain/usecases/remove_supplier.dart';
import 'package:pos_app/features/supplier/domain/usecases/save_supplier.dart';
import 'package:pos_app/features/supplier/domain/usecases/update_supplier.dart';

final saveSupplierUseCaseProvider = Provider<SaveSupplier>((ref) {
  return SaveSupplier(ref.read(supplierRepositoryProvider));
});

final removeSupplierUseCaseProvider = Provider<RemoveSupplier>((ref) {
  return RemoveSupplier(ref.read(supplierRepositoryProvider));
});

/*final changeSupplierStateUseCaseProvider = Provider<ChangeSupplierState>((ref) {
  return ChangeSupplierState(ref.read(supplierRepositoryProvider));
});*/

final updateSupplierUseCaseProvider = Provider<UpdateSupplier>((ref) {
  return UpdateSupplier(ref.read(supplierRepositoryProvider));
});
