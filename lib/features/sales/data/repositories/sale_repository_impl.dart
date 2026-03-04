import 'package:pos_app/core/network/connectivity_service.dart';
import 'package:pos_app/features/sales/data/datasources/sale_local_datasource.dart';
import 'package:pos_app/features/sales/data/datasources/sale_remote_datasource.dart';
import 'package:pos_app/features/sales/data/models/sale_model.dart';
import 'package:pos_app/features/sales/domain/entities/sale.dart';

abstract class SaleRepository {
  Future<void> createSale(Sale sale);
  Future<List<Sale>> getSales();
  Future<void> syncSales();
}

class SaleRepositoryImpl implements SaleRepository{

  final SaleLocalDatasource local;
  final SaleRemoteDatasource remote;
  final ConnectivityService connectivity;

  SaleRepositoryImpl(
    this.local, 
    this.remote, 
    this.connectivity
  );
    
  @override
  Future<void> createSale(Sale sale) async {
    final model = SaleModel(
      id: sale.id,
      items: sale.items.cast(), 
      createdAt: sale.createdAt, 
      synced: sale.synced
    );

    await local.saveSale(model);

    if(await connectivity.isOnline()){
      await remote.sendSale(model);
      await local.markAsSynced(model.id);
    }
  }
    
  @override
  Future<List<Sale>> getSales() {
    return local.getUnsyncedSales();
  }

  @override
  Future<void> syncSales() async {
    final unsynced = await local.getUnsyncedSales();
    for(final sale in unsynced){
      await remote.sendSale(sale);
      await local.markAsSynced(sale.id);
    }
  }
  
}