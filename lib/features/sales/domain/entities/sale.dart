import 'package:pos_app/features/sales/domain/entities/sale_item.dart';

class Sale{
  final String id;
  final List<SaleItem> items;
  final DateTime createdAt;
  final bool synced;

  Sale({
    required this.id,
    required this.items,
    required this.createdAt,
    this.synced = false,
  });

  double get total => items.fold(0, (sum , item) => sum + item.subtotal);
}