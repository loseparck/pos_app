import '../domain/entities/product_group.dart';

class ProductGroupRepository {

  final List<ProductGroup> groups = [

    const ProductGroup(
      id: "drinks",
      name: "Boissons",
      parentId: null,
    ),

    const ProductGroup(
      id: "foods",
      name: "Plats",
      parentId: null,
    ),

    const ProductGroup(
      id: "hot_drinks",
      name: "Boissons chaudes",
      parentId: "drinks",
    ),

    const ProductGroup(
      id: "cold_drinks",
      name: "Boissons froides",
      parentId: "drinks",
    ),
  ];

  Future<List<ProductGroup>> getGroupsByParent(
      String? parentId) async {

    return groups
        .where((g) => g.parentId == parentId)
        .toList();
  }

  String? getParent(String groupId) {

    final group =
        groups.firstWhere((g) => g.id == groupId);

    return group.parentId;
  }
}