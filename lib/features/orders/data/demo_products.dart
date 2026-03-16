import '../domain/entities/product.dart';
import '../domain/entities/product_group.dart';

final List<ProductGroup> demoGroups = [

  ProductGroup(
    id: "drinks",
    name: "Boissons",
    parentId: null,
  ),

  ProductGroup(
    id: "foods",
    name: "Plats",
    parentId: null,
  ),

  ProductGroup(
    id: "hot_drinks",
    name: "Boissons Chaudes",
    parentId: "drinks",
  ),

  ProductGroup(
    id: "cold_drinks",
    name: "Boissons Froides",
    parentId: "drinks",
  ),
];

final List<Product> demoProducts = [

  Product(
    id: "coffee",
    name: "Café",
    price: 2.0,
    groupId: "hot_drinks",
    description: "Café expresso",
  ),

  Product(
    id: "tea",
    name: "Thé",
    price: 2.5,
    groupId: "hot_drinks",
    description: "Thé vert ou noir",
  ),

  Product(
    id: "cola",
    name: "Coca Cola",
    price: 3.0,
    groupId: "cold_drinks",
    description: "33cl",
  ),

  Product(
    id: "burger",
    name: "Burger",
    price: 10.0,
    groupId: "foods",
    description: "Burger maison",
  ),

  Product(
    id: "pizza",
    name: "Pizza",
    price: 12.0,
    groupId: "foods",
    description: "Pizza margherita",
  ),
];