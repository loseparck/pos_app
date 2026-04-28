import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/catalog/data/repositories/product_repository_provider.dart';
import 'package:pos_app/features/catalog/domain/usecases/remove_item.dart';
import 'package:pos_app/features/catalog/domain/usecases/remove_items.dart';
import 'package:pos_app/features/catalog/domain/usecases/save_item.dart';
import 'package:pos_app/features/catalog/domain/usecases/save_option.dart';
import 'package:pos_app/features/catalog/domain/usecases/remove_option.dart';
import 'package:pos_app/features/catalog/domain/usecases/update_item.dart';
import 'package:pos_app/features/catalog/domain/usecases/update_option.dart';

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
