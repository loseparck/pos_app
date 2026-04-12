import 'package:pos_app/features/catalog/domain/entities/option_item.dart';
import 'package:pos_app/features/catalog/domain/entities/product_group.dart';
import 'package:pos_app/features/catalog/domain/entities/product_option.dart';

import '../domain/entities/product.dart';

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

final List<ProductOption> demoOptions = [

  ProductOption(
    id: "IDG1",
    name: "Base",
    isMandatory: true,
    minToSelect: 2,
    maxToSelect: 5,
    multipleSelect: true, 
    items: [
      OptionItem(
        id: "IDG1O1",
        name: "Base Orange",
        price: 5,
        groupId: "IDG1",
      ),
      OptionItem(
        id: "IDG1O2",
        name: "Base Lait",
        groupId: "IDG1",
      ),
    ]
  ),
  ProductOption(
    isMandatory: true,
    minToSelect: 1,
    maxToSelect: 1,
    id: "IDG2",
    name: "Topping", 
    items: [
      OptionItem(
        id: "IDG2O1",
        name: "Creme",
        price: 5,
        groupId: "IDG2",
      ),
      OptionItem(
        id: "IDG2O2",
        name: "Cannelle",
        groupId: "IDG2",
      ),
    ]
  ),
  ProductOption(
    id: "IDG3",
    name: "Chocolat",
    isMandatory: true,
    minToSelect: 2,
    maxToSelect: 5,
    multipleSelect: true, 
    items: [
      OptionItem(
        id: "IDG3O1",
        name: "Nutella",
        price: 5,
        groupId: "IDG3",
      ),
      OptionItem(
        id: "IDG3O2",
        name: "Mars",
        groupId: "IDG3",
      ),
      OptionItem(
        id: "IDG3O3",
        name: "Snickers",
        groupId: "IDG3",
      ),
      OptionItem(
        id: "IDG3O4",
        name: "Twix",
        groupId: "IDG3",
      ),
      OptionItem(
        id: "IDG3O5",
        name: "Oreo",
        groupId: "IDG3",
      ),
      OptionItem(
        id: "IDG3O6",
        name: "KitKat",
        groupId: "IDG3",
      ),
      OptionItem(
        id: "IDG3O7",
        name: "Milka",
        groupId: "IDG3",
      ),
    ]
  )
];

final List<Product> demoProducts = [

  Product(
    id: "coffee",
    name: "Café",
    price: 2.0,
    groupId: "hot_drinks",
    description: "Café expresso",
    options: [
        ProductOption(
          id: "IDG1",
          name: "Base",
          isMandatory: true,
          minToSelect: 2,
          maxToSelect: 5,
          multipleSelect: true, 
          items: [
            OptionItem(
              id: "IDG1O1",
              name: "Base Orange",
              price: 5,
              groupId: "IDG1",
            ),
            OptionItem(
              id: "IDG1O2",
              name: "Base Lait",
              groupId: "IDG1",
            ),
          ]
        ),
        ProductOption(
          isMandatory: true,
          minToSelect: 1,
          maxToSelect: 1,
          id: "IDG2",
          name: "Topping", 
          items: [
            OptionItem(
              id: "IDG2O1",
              name: "Creme",
              price: 5,
              groupId: "IDG2",
            ),
            OptionItem(
              id: "IDG2O2",
              name: "Cannelle",
              groupId: "IDG2",
            ),
          ]
        ),
        ProductOption(
          id: "IDG3",
          name: "Chocolat",
          isMandatory: true,
          minToSelect: 2,
          maxToSelect: 5,
          multipleSelect: true, 
          items: [
            OptionItem(
              id: "IDG3O1",
              name: "Nutella",
              price: 5,
              groupId: "IDG3",
            ),
            OptionItem(
              id: "IDG3O2",
              name: "Mars",
              groupId: "IDG3",
            ),
            OptionItem(
              id: "IDG3O3",
              name: "Snickers",
              groupId: "IDG3",
            ),
            OptionItem(
              id: "IDG3O4",
              name: "Twix",
              groupId: "IDG3",
            ),
            OptionItem(
              id: "IDG3O5",
              name: "Oreo",
              groupId: "IDG3",
            ),
            OptionItem(
              id: "IDG3O6",
              name: "KitKat",
              groupId: "IDG3",
            ),
            OptionItem(
              id: "IDG3O7",
              name: "Milka",
              groupId: "IDG3",
            ),
          ]
        ),
      ]
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