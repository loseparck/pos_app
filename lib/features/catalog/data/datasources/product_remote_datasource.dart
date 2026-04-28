import 'package:pos_app/features/catalog/data/models/dto/create_option_item_dto.dart';
import 'package:pos_app/features/catalog/data/models/dto/create_product_option_dto.dart';
import 'package:pos_app/features/catalog/data/models/dto/update_option_item_dto.dart';
import 'package:pos_app/features/catalog/data/models/dto/update_product_option_dto.dart';
import 'package:pos_app/features/catalog/domain/entities/option_item.dart';
import 'package:pos_app/features/catalog/domain/entities/product_option.dart';

abstract class ProductRemoteDataSource {
  Future<ProductOption> saveOption(CreateProductOptionDto option);
  Future<OptionItem> saveItem(CreateOptionItemDto item);

  Future<List<OptionItem>> getItems();
  Future<OptionItem> getItem(String itemId);
  Future<List<OptionItem>> getItemByOptionId(String optionId);
  Future<List<ProductOption>> getOptions();
  Future<ProductOption> getOption(String id);
  Future<ProductOption> getOptionWithItems(String id);
  
  Future<void> removeOption(String optionId);
  Future<void> removeItem(String itemId);

  Future<ProductOption> updateOption(UpdateProductOptionDto option, String optionId);
  Future<OptionItem> updateItem(UpdateOptionItemDto item, String itemId);
  
  /*Future<List<ProductOption>> getOptionByProductId(String productId);
  Future<List<OptionItem>> getItemByOptionId(String optionId);*/
  
  
  
  
  
  

}