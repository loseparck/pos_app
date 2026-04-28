import 'package:pos_app/features/catalog/domain/entities/option_item.dart';
import 'package:pos_app/features/catalog/domain/entities/product_option.dart';

abstract class ProductRepository {
  Future<ProductOption> saveOption(ProductOption option);
  Future<OptionItem> saveItem(OptionItem option);

  Future<List<OptionItem>> getItems();
  Future<List<OptionItem>> getItemByOptionId(String optionId);
  Future<OptionItem?> getItem(String id);
  Future<List<ProductOption>> getOptions();
  Future<ProductOption?> getOption(String id);
  
  Future<void> removeOption(String optionId);
  Future<void> removeItem(String itemId);
  Future<void> removeItems(List<String> itemId);

  Future<ProductOption> updateOption(ProductOption option);
  Future<OptionItem> updateItem(OptionItem item);
  //Future<List<Product>> getProductsByGroup();
  
  
  //Future<List<ProductOption>> getOptionByProductId(String productId);
  
  
}