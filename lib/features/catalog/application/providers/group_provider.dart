import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/product_group_repository.dart';
import '../../domain/entities/product_group.dart';

final productGroupRepositoryProvider =
Provider<ProductGroupRepository>((ref) {
  return ProductGroupRepository();
});

final productGroupsProvider =
FutureProvider.family<List<ProductGroup>, String?>(
  (ref, parentId) async {

    final repo =
        ref.read(productGroupRepositoryProvider);

    return repo.getGroupsByParent(parentId);
  },
);

final groupParentProvider =
Provider.family<String?, String>((ref, groupId) {

  final repo =
      ref.read(productGroupRepositoryProvider);

  return repo.getParent(groupId);
});