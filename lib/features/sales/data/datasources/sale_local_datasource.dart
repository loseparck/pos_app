import 'package:pos_app/features/sales/data/models/sale_model.dart';

abstract class SaleLocalDatasource {
  Future<void> saveSale(SaleModel sale);
  Future<List<SaleModel>> getUnsyncedSales();
  Future<void> markAsSynced(String id);
}