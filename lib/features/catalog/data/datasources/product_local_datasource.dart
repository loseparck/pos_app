import 'package:pos_app/data/local/db/app_database.dart';
import 'package:pos_app/features/catalog/domain/entities/discount.dart';
import 'package:pos_app/features/catalog/domain/entities/item.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';
import 'package:pos_app/features/catalog/domain/entities/category.dart';
import 'package:pos_app/features/catalog/domain/entities/option.dart';

abstract class ProductLocalDataSource {
  Future<Option?> saveOption(Option option);
  Future<Item?> saveItem(Item item);

  Future<List<Item>> getItems();
  Future<ItemsDriftData?> getItem(String itemId);
  Future<List<Item>> getItemByOptionId(String optionId) ;
  Future<List<Option>> getOptions();
  Future<OptionsDriftData?> getOption(String id);
  Future<Option?> getOptionWithItems(String id);
  //Future<List<Product>> getProductsByGroup();
  
  Future<void> removeOption(String optionId);
  Future<void> removeItem(String itemId);
  Future<void> removeItems(List<String> itemsId);

  Future<Option?> updateOption(Option option);
  Future<Item?> updateItem(Item item);
  
  Future<Category?> saveCategory(Category category);
  Future<Product?> saveProduct(Product product);
  Future<Discount?> saveDiscount(Discount discount);

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

  Future<Category?> updateCategory(Category category);
  Future<Product?> updateProduct(Product product);
  Future<Discount?> changeDiscountState(String discountId, bool newState);
}