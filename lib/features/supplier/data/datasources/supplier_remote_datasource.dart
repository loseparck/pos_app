
import 'package:pos_app/features/supplier/data/models/dto/create_supplier_dto.dart';
import 'package:pos_app/features/supplier/data/models/dto/update_supplier_dto.dart';
import 'package:pos_app/features/supplier/domain/entities/supplier.dart';

abstract class SupplierRemoteDatasource {
  Future<Supplier> saveSupplier(CreateSupplierDto supplier);
  Future<List<Supplier>> getSuppliers();
  Future<Supplier?> getSupplier(String id);
  Future<void> removeSupplier(String id);
  Future<Supplier> updateSupplier(UpdateSupplierDto supplier, String supplierId);
  Future<Supplier> changeSupplierState(String supplierId, bool state);
}