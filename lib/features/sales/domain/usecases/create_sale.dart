import 'package:pos_app/features/sales/data/repositories/sale_repository_impl.dart';
import 'package:pos_app/features/sales/domain/entities/sale.dart';
import 'package:pos_app/features/sales/domain/entities/sale_item.dart';

class CreateSale {
  final SaleRepository repository;
  CreateSale(this.repository);

  Future<void> call(List<SaleItem> items) async{
    final sale = Sale(
      id: DateTime.now().millisecond.toString(),
      items: items, 
      createdAt: DateTime.now()
      );
      await repository.createSale(sale);
  }
}