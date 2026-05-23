import '../domain/entities/category.dart';

class ProductGroupRepository {

  final List<Category> groups = [

   /* const Category(
      id: "drinks",
      name: "Boissons",
      parentId: null,
    ),

    const Category(
      id: "foods",
      name: "Plats",
      parentId: null,
    ),

    const Category(
      id: "hot_drinks",
      name: "Boissons chaudes",
      parentId: "drinks",
    ),

    const Category(
      id: "cold_drinks",
      name: "Boissons froides",
      parentId: "drinks",
    ),*/
  ];

  Future<List<Category>> getGroupsByParent(
      String? parentId) async {

    return groups
        .where((g) => g.parent?.id == parentId)
        .toList();
  }

  String? getParent(String groupId) {

    final group =
        groups.firstWhere((g) => g.id == groupId);

    return group.parent?.id;
  }
}