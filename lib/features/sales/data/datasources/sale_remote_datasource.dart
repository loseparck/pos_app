import 'package:dio/dio.dart';
import 'package:pos_app/features/sales/data/models/sale_model.dart';

abstract class SaleRemoteDatasource {
  Future<void> sendSale(SaleModel sale);
}

class SaleRemoteDatasourceImpl implements SaleRemoteDatasource {
  final Dio client;

  SaleRemoteDatasourceImpl(this.client);

  @override
  Future<void> sendSale(SaleModel sale) async{
    await client.post('/sales', data: sale.toJson());
  }
}