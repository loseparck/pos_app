import 'package:pos_app/features/catalog/domain/entities/category.dart';
import 'package:pos_app/features/catalog/domain/entities/item.dart';
import 'package:pos_app/features/catalog/domain/entities/option.dart';

import '../domain/entities/product.dart';

/*final List<Category> demoGroups = [

  Category(
    id: "drinks",
    name: "Boissons",
    parent: null,
  ),

  Category(
    id: "foods",
    name: "Plats",
    parent: null,
  ),

  Category(
    id: "hot_drinks",
    name: "Boissons Chaudes",
    //parentId: "drinks",
  ),

  Category(
    id: "cold_drinks",
    name: "Boissons Froides",
    //parentId: "drinks",
  ),
];*/

final List<Option> demoOptionss = [

  Option(
    id: "IDG1",
    name: "Base",
    isMandatory: true,
    minToSelect: 2,
    maxToSelect: 5,
    multipleSelect: true, 
    items: [
      Item(
        id: "IDG1O1",
        name: "Base Orange",
        price: 5,
        option: Option(name: '"IDG1"', items: []) ,
      ),
      Item(
        id: "IDG1O2",
        name: "Base Lait",
        option: Option(name: '"IDG1"', items: []) ,
      ),
    ]
  ),
  Option(
    isMandatory: true,
    minToSelect: 1,
    maxToSelect: 1,
    id: "IDG2",
    name: "Topping", 
    items: [
      Item(
        id: "IDG2O1",
        name: "Creme",
        price: 5,
        option: Option(name: '"IDG2"', items: []) ,
      ),
      Item(
        id: "IDG2O2",
        name: "Cannelle",
        option: Option(name: '"IDG2"', items: []) ,
      ),
    ]
  ),
  Option(
    id: "IDG3",
    name: "Chocolat",
    isMandatory: true,
    minToSelect: 2,
    maxToSelect: 5,
    multipleSelect: true, 
    items: [
      Item(
        id: "IDG3O1",
        name: "Nutella",
        price: 5,
        option: Option(name: '"IDG3"', items: []) ,
      ),
      Item(
        id: "IDG3O2",
        name: "Mars",
        option: Option(name: '"IDG3"', items: []) ,
      ),
      Item(
        id: "IDG3O3",
        name: "Snickers",
        option: Option(name: '"IDG3"', items: []) ,
      ),
      Item(
        id: "IDG3O4",
        name: "Twix",
        option: Option(name: '"IDG3"', items: []) ,
      ),
      Item(
        id: "IDG3O5",
        name: "Oreo",
        option: Option(name: '"IDG3"', items: []) ,
      ),
      Item(
        id: "IDG3O6",
        name: "KitKat",
        option: Option(name: '"IDG3"', items: []) ,
      ),
      Item(
        id: "IDG3O7",
        name: "Milka",
        option: Option(name: '"IDG3"', items: []) ,
      ),
    ]
  )
];

/*final List<Product> demoProducts = [
/*
  Product(
    id: "coffee",
    name: "Café",
    price: 2.0,
    categoryId: "hot_drinks",
    description: "Café expresso",
    options: [
        Option(
          id: "IDG1",
          name: "Base",
          isMandatory: true,
          minToSelect: 2,
          maxToSelect: 5,
          multipleSelect: true, 
          items: [
            Item(
              id: "IDG1O1",
              name: "Base Orange",
              price: 5,
              optionId: "IDG1",
            ),
            Item(
              id: "IDG1O2",
              name: "Base Lait",
              optionId: "IDG1",
            ),
          ]
        ),
        Option(
          isMandatory: true,
          minToSelect: 1,
          maxToSelect: 1,
          id: "IDG2",
          name: "Topping", 
          items: [
            Item(
              id: "IDG2O1",
              name: "Creme",
              price: 5,
              optionId: "IDG2",
            ),
            Item(
              id: "IDG2O2",
              name: "Cannelle",
              optionId: "IDG2",
            ),
          ]
        ),
        Option(
          id: "IDG3",
          name: "Chocolat",
          isMandatory: true,
          minToSelect: 2,
          maxToSelect: 5,
          multipleSelect: true, 
          items: [
            Item(
              id: "IDG3O1",
              name: "Nutella",
              price: 5,
              optionId: "IDG3",
            ),
            Item(
              id: "IDG3O2",
              name: "Mars",
              optionId: "IDG3",
            ),
            Item(
              id: "IDG3O3",
              name: "Snickers",
              optionId: "IDG3",
            ),
            Item(
              id: "IDG3O4",
              name: "Twix",
              optionId: "IDG3",
            ),
            Item(
              id: "IDG3O5",
              name: "Oreo",
              optionId: "IDG3",
            ),
            Item(
              id: "IDG3O6",
              name: "KitKat",
              optionId: "IDG3",
            ),
            Item(
              id: "IDG3O7",
              name: "Milka",
              optionId: "IDG3",
            ),
          ]
        ),
      ]
  ),

  Product(
    id: "tea",
    name: "Thé",
    price: 2.5,
    categoryId: "hot_drinks",
    description: "Thé vert ou noir",
  ),

  Product(
    id: "cola",
    name: "Coca Cola",
    price: 3.0,
    categoryId: "cold_drinks",
    description: "33cl",
  ),

  Product(
    id: "burger",
    name: "Burger",
    price: 10.0,
    categoryId: "foods",
    description: "Burger maison",
  ),

  Product(
    id: "pizza",
    name: "Pizza",
    price: 12.0,
    categoryId: "foods",
    description: "Pizza margherita",
  ),*/
];*/