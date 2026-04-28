import 'package:pos_app/data/local/db/app_database.dart';
import 'package:pos_app/features/catalog/domain/entities/option_item.dart';
import 'package:pos_app/features/catalog/domain/entities/product_option.dart';

abstract class ProductLocalDataSource {
  Future<ProductOption> saveOption(ProductOption option);
  Future<OptionItem> saveItem(OptionItem item);

  Future<List<OptionItem>> getItems();
  Future<OptionItemsDriftData?> getItem(String itemId);
  Future<List<OptionItem>> getItemByOptionId(String optionId);
  Future<List<ProductOption>> getOptions();
  Future<ProductOptionsDriftData?> getOption(String id);
  Future<ProductOption> getOptionWithItems(String id);
  //Future<List<Product>> getProductsByGroup();
  
  Future<void> removeOption(String optionId);
  Future<void> removeItem(String itemId);
  Future<void> removeItems(List<String> itemsId);

  Future<ProductOption> updateOption(ProductOption option);
  Future<OptionItem> updateItem(OptionItem item);

  //Future<List<ProductOption>> getOptionByProductId(String productId);
  
}