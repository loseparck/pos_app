import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/orders/data/repositories/product_repository.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';

final productRepositoryProvider =
Provider((ref) => ProductRepository());

final productProvider =
FutureProvider.family<List<Product>, String?>(
  (ref, groupId) async {

    final repo = ref.read(productRepositoryProvider);

    return repo.getProductsByGroup(groupId);
  },
);