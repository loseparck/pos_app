import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/catalog/data/repositories/product_repository_provider.dart';
import 'package:pos_app/features/catalog/domain/usecases/change_discount_state.dart';
import 'package:pos_app/features/catalog/domain/usecases/remove_category.dart';
import 'package:pos_app/features/catalog/domain/usecases/remove_category_with_children.dart';
import 'package:pos_app/features/catalog/domain/usecases/remove_discount.dart';
import 'package:pos_app/features/catalog/domain/usecases/remove_item.dart';
import 'package:pos_app/features/catalog/domain/usecases/remove_items.dart';
import 'package:pos_app/features/catalog/domain/usecases/remove_product.dart';
import 'package:pos_app/features/catalog/domain/usecases/remove_products.dart';
import 'package:pos_app/features/catalog/domain/usecases/save_category.dart';
import 'package:pos_app/features/catalog/domain/usecases/save_discount.dart';
import 'package:pos_app/features/catalog/domain/usecases/save_item.dart';
import 'package:pos_app/features/catalog/domain/usecases/save_option.dart';
import 'package:pos_app/features/catalog/domain/usecases/remove_option.dart';
import 'package:pos_app/features/catalog/domain/usecases/save_product.dart';
import 'package:pos_app/features/catalog/domain/usecases/update_category.dart';
import 'package:pos_app/features/catalog/domain/usecases/update_item.dart';
import 'package:pos_app/features/catalog/domain/usecases/update_option.dart';
import 'package:pos_app/features/catalog/domain/usecases/update_product.dart';

final saveOptionUseCaseProvider = Provider<SaveOption>((ref) {
  return SaveOption(ref.read(productRepositoryProvider));
});

final saveItemUseCaseProvider = Provider<SaveItem>((ref) {
  return SaveItem(ref.read(productRepositoryProvider));
});

final removeOptionUseCaseProvider = Provider<RemoveOption>((ref) {
  return RemoveOption(ref.read(productRepositoryProvider));
});

final removeItemUseCaseProvider = Provider<RemoveItem>((ref) {
  return RemoveItem(ref.read(productRepositoryProvider));
});

final removeItemsUseCaseProvider = Provider<RemoveItems>((ref) {
  return RemoveItems(ref.read(productRepositoryProvider));
});

final updateOptionUseCaseProvider = Provider<UpdateOption>((ref) {
  return UpdateOption(ref.read(productRepositoryProvider));
});

final updateItemUseCaseProvider = Provider<UpdateItem>((ref) {
  return UpdateItem(ref.read(productRepositoryProvider));
});

////
final saveCategoryUseCaseProvider = Provider<SaveCategory>((ref) {
  return SaveCategory(ref.read(productRepositoryProvider));
});

final saveProductUseCaseProvider = Provider<SaveProduct>((ref) {
  return SaveProduct(ref.read(productRepositoryProvider));
});

final saveDiscountUseCaseProvider = Provider<SaveDiscount>((ref) {
  return SaveDiscount(ref.read(productRepositoryProvider));
});

final removeCategoryUseCaseProvider = Provider<RemoveCategory>((ref) {
  return RemoveCategory(ref.read(productRepositoryProvider));
});

final removeCategoryWithChilrendUseCaseProvider = Provider<RemoveCategoryWithChildren>((ref) {
  return RemoveCategoryWithChildren(ref.read(productRepositoryProvider));
});

final removeProductUseCaseProvider = Provider<RemoveProduct>((ref) {
  return RemoveProduct(ref.read(productRepositoryProvider));
});

final removeProductsUseCaseProvider = Provider<RemoveProducts>((ref) {
  return RemoveProducts(ref.read(productRepositoryProvider));
});

final removeDiscountUseCaseProvider = Provider<RemoveDiscount>((ref) {
  return RemoveDiscount(ref.read(productRepositoryProvider));
});

final updateCategoryUseCaseProvider = Provider<UpdateCategory>((ref) {
  return UpdateCategory(ref.read(productRepositoryProvider));
});

final updateProductUseCaseProvider = Provider<UpdateProduct>((ref) {
  return UpdateProduct(ref.read(productRepositoryProvider));
});

final changeDiscountStateUseCaseProvider = Provider<ChangeDiscountState>((ref) {
  return ChangeDiscountState(ref.read(productRepositoryProvider));
});
