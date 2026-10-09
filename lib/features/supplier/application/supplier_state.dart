import 'package:pos_app/features/supplier/domain/entities/supplier.dart';

class SupplierState{
  final List<Supplier> suppliers;

  final String? selectedSupplierId;

  SupplierState({
    required this.suppliers,
    this.selectedSupplierId,
  });


  Supplier? getSupplierById(String supplierId) {
    try{
      return suppliers.firstWhere((supplier) => supplier.id == supplierId);
    } catch(_){
      return null;
    }
  } 

  Supplier? get selectedSupplier {
    if(selectedSupplierId == null) return null;
    try{
      return suppliers.firstWhere((supplier) => supplier.id == selectedSupplierId);
    } catch(_){
      return null;
    }
  } 

  SupplierState copyWith({
    List<Supplier>? suppliers,
    String? selectedSupplierId,
    bool? resetSupplierId,
  }){
    return SupplierState(
      suppliers: suppliers ?? this.suppliers,
      selectedSupplierId: resetSupplierId == true ? null : selectedSupplierId ?? this.selectedSupplierId
    );
  }
}