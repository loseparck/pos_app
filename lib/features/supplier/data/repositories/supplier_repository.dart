import 'package:pos_app/features/supplier/domain/entities/supplier.dart';

abstract class SupplierRepository {
  Future<Supplier> saveSupplier(Supplier supplier);
  Future<List<Supplier>> getSuppliers();
  Future<Supplier?> getSupplier(String id);
  Future<void> removeSupplier(String id);
  Future<Supplier> updateSupplier(Supplier supplier);
  Future<Supplier?> changeSupplierState(String supplierId, bool state);
}