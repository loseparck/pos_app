import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/supplier/application/supplier_state.dart';
import 'package:pos_app/features/supplier/data/repositories/supplier_repository.dart';
import 'package:pos_app/features/supplier/domain/entities/supplier.dart';
import 'usecase_provider.dart';

class SupplierNotifier extends StateNotifier<SupplierState> {
  final Ref ref;
  final SupplierRepository _repository;

  SupplierNotifier(this.ref, this._repository) : 
    super(
      SupplierState(
        suppliers: []
      )
    );


  Future<void> load() async {
    final suppliers = await _repository.getSuppliers();
    state = state.copyWith(
      suppliers: suppliers
    );
  } 

  Future<Supplier?> addSupplier(Supplier supplier) async {
    try {
      final saveSupplierUseCase = ref.read(saveSupplierUseCaseProvider);
      final newSupplier = await saveSupplierUseCase(supplier);
      state = state.copyWith(
        suppliers: [...state.suppliers, newSupplier],
      );
      return newSupplier;
    } catch (e) {
      if (kDebugMode) {
        print("Error ${e.toString()}");
      }
      return null;
    }
  }

  Future<void> updateSupplier(Supplier supplier) async {
    final updateSupplierUseCase = ref.read(updateSupplierUseCaseProvider);
    updateSupplierUseCase(supplier);
      
    state = state.copyWith(
      suppliers: state.suppliers.map((elem) => elem.id != supplier.id ? elem: supplier).toList(),
    );
  }

 /* Future<void> toggleSupplier(String supplierId, bool newState) async {
      final changeSupplierStateUseCase = ref.read(changeSupplierStateUseCaseProvider);
      changeSupplierStateUseCase(supplierId, newState);
       
      state = state.copyWith(
        suppliers: state.suppliers.map((elem) => elem.id != supplierId ? elem: elem.copyWith(isActive: newState)).toList(),
      );
  }*/

  Future<void> removeSupplier(String id) async {
      final removeSupplierUseCase = ref.read(removeSupplierUseCaseProvider);
      removeSupplierUseCase(id);
      state = state.copyWith(
        suppliers: state.suppliers.where((item) => item.id != id).toList(),
      );
  }

}