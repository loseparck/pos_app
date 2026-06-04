import 'package:pos_app/features/catalog/data/models/dto/create_category_dto.dart';
import 'package:pos_app/features/catalog/data/models/dto/create_discount_dto.dart';
import 'package:pos_app/features/catalog/data/models/dto/create_item_dto.dart';
import 'package:pos_app/features/catalog/data/models/dto/create_option_dto.dart';
import 'package:pos_app/features/catalog/data/models/dto/create_product_dto.dart';
import 'package:pos_app/features/catalog/data/models/dto/update_category_dto.dart';
import 'package:pos_app/features/catalog/data/models/dto/update_item_dto.dart';
import 'package:pos_app/features/catalog/data/models/dto/update_option_dto.dart';
import 'package:pos_app/features/catalog/data/models/dto/update_product_dto.dart';
import 'package:pos_app/features/catalog/domain/entities/discount.dart';
import 'package:pos_app/features/catalog/domain/entities/item.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';
import 'package:pos_app/features/catalog/domain/entities/category.dart';
import 'package:pos_app/features/catalog/domain/entities/option.dart';

abstract class ProductRemoteDataSource {
  Future<Option> saveOption(CreateOptionDto option);
  Future<Item> saveItem(CreateItemDto item);

  Future<List<Item>> getItems();
  Future<Item> getItem(String itemId);
  Future<List<Item>> getItemByOptionId(String optionId);
  Future<List<Option>> getOptions();
  Future<Option> getOption(String id);
  Future<Option> getOptionWithItems(String id);
  
  Future<void> removeOption(String optionId);
  Future<void> removeItem(String itemId);
  Future<void> removeItems(List<String> itemsId);

  Future<Option> updateOption(UpdateOptionDto option, String optionId);
  Future<Item> updateItem(UpdateItemDto item, String itemId);
  
  /*Future<List<Option>> getOptionByProductId(String productId);
  Future<List<Item>> getItemByOptionId(String optionId);*/
  
  
  Future<Category> saveCategory(CreateCategoryDto category);
  Future<Product> saveProduct(CreateProductDto product);
  Future<Discount> saveDiscount(CreateDiscountDto product);

  Future<List<Category>> getCategories();
  Future<List<Product>> getProducts();
  Future<List<Discount>> getDiscounts();
  Future<Category?> getCategory(String id);
  Future<Product?> getProduct(String id);
  Future<Discount?> getDiscount(String id);
  Future<List<Product>> getProductsByCategory(String categoryId);
  

  Future<void> removeCategory(String id);
  Future<void> removeCategoryWithChildren(String id);
  Future<void> removeProduct(String id);
  Future<void> removeProducts(List<String> ids);
  Future<void> removeDiscount(String id);
  Future<void> removeDiscounts(List<String> ids);

  Future<Category> updateCategory(UpdateCategoryDto category, String categoryId);
  Future<Product> updateProduct(UpdateProductDto product, String productId);
  Future<Discount> changeDiscountState(String discountId, bool newState);

}