import 'package:pos_app/data/local/db/app_database.dart';
import 'package:drift/drift.dart';
import 'package:pos_app/features/catalog/data/models/dto/update_option_item_dto.dart';
import 'package:pos_app/features/catalog/data/models/dto/update_product_option_dto.dart';

import '../../domain/entities/option_item.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/product_group.dart';
import '../../domain/entities/product_option.dart';
import '../models/dto/create_option_item_dto.dart';
import '../models/dto/product_dto.dart';
import '../models/dto/product_group_dto.dart';
import '../models/dto/create_product_option_dto.dart';

extension OptionItemMapper on OptionItem {
  CreateOptionItemDto toCreateDto() {
    return CreateOptionItemDto(
      id: id,
      name: name,
      price: price,
      groupId: groupId,
      vat: vat,
      isActive: isActive,
      createdAt: createdAt,
      createdById: createdById
    );
  }

  UpdateOptionItemDto toUpdateDto() {
    return UpdateOptionItemDto(
      name: name,
      price: price,
      vat: vat,
      isActive: isActive,
      updatedAt: DateTime.now(),
    );
  }

  OptionItemsDriftCompanion toDrift(int optionLocalId, {String? optionRemoteId}) {
    return OptionItemsDriftCompanion(
      remoteId: Value(id),
      name: Value(name),
      price: Value(price),
      groupId:  Value(optionRemoteId ?? groupId),
      vat: Value(vat),
      isActive: Value(isActive),
      productOptionId: Value(optionLocalId),
      createdAt: Value(createdAt ?? DateTime.now()),
      updatedAt: Value(updatedAt ?? DateTime.now()),
      deletedAt: Value(deletedAt),
      createdById: Value(createdById)
    );
  }
}

extension OptionItemDtoMapper on CreateOptionItemDto {
  OptionItem toEntity() {
    return OptionItem(
      id: id,
      name: name,
      price: price,
      groupId: groupId,
    );
  }

  OptionItemsDriftCompanion toDrift() {
    return OptionItemsDriftCompanion(
      remoteId: Value(id),
      name: Value(name),
      price: Value(price),
    );
  }
}

extension OptionItemDriftMapper on OptionItemsDriftData {
  OptionItem toEntity() {
    return OptionItem(
      id: remoteId,
      name: name,
      price: price,
      groupId: groupId,
      isActive: isActive,
      vat: vat ?? 0
    );
  }
}



extension ProductOptionMapper on ProductOption {
  CreateProductOptionDto toCreateDto() {
    return CreateProductOptionDto(
      id: id,
      name: name,
      isMandatory: isMandatory,
      minToSelect: minToSelect,
      maxToSelect: maxToSelect,
      multipleSelect: multipleSelect,
      isActive: isActive,
      items: items.map((e) => e.toCreateDto()).toList(),
      createdAt: createdAt,
      createdById: createdById
    );
  }

  UpdateProductOptionDto toUpdateDto() {
    return UpdateProductOptionDto(
      name: name,
      isMandatory: isMandatory,
      minToSelect: minToSelect,
      maxToSelect: maxToSelect,
      multipleSelect: multipleSelect,
      isActive: isActive,
      updatedAt: DateTime.now(),
    );
  }

  ProductOptionsDriftCompanion toDrift() {
    return ProductOptionsDriftCompanion(
      remoteId: Value(id),
      name: Value(name),
      isMandatory: Value(isMandatory),
      minToSelect: Value(minToSelect),
      maxToSelect: Value(maxToSelect),
      multipleSelect: Value(multipleSelect),
      isActive: Value(isActive),
      createdAt: Value(createdAt ?? DateTime.now()),
      updatedAt: Value(updatedAt ?? DateTime.now()),
      deletedAt: Value(deletedAt),
      createdById: Value(createdById)
    );  
  }
}

extension ProductOptionDtoMapper on CreateProductOptionDto {
  ProductOption toEntity() {
    return ProductOption(
      id: id,
      name: name,
      isMandatory: isMandatory,
      minToSelect: minToSelect,
      maxToSelect: maxToSelect,
      multipleSelect: multipleSelect,
      items: items.map((e) => e.toEntity()).toList(),
    );
  }

  ProductOptionsDriftCompanion toDrift() {
    return ProductOptionsDriftCompanion(
      remoteId: Value(id),
      name: Value(name),
      isMandatory: Value(isMandatory),
      minToSelect: Value(minToSelect),
      maxToSelect: Value(maxToSelect),
      multipleSelect: Value(multipleSelect),
    );
  }
}

extension ProductOptionDriftMapper on ProductOptionsDriftData {
  ProductOption toEntity() {
    return ProductOption(
      id: remoteId,
      name: name,
      isMandatory: isMandatory,
      minToSelect: minToSelect,
      maxToSelect: maxToSelect,
      multipleSelect: multipleSelect,
      items: [],
    );
  }
}



extension ProductGroupDtoMapper on ProductGroupDto {
  ProductGroup toEntity() {
    return ProductGroup(
      id: id,
      name: name,
      parentId: parentId,
      isActive: isActive,
    );
  }

   ProductGroupsDriftCompanion toCompanion() {
    return ProductGroupsDriftCompanion(
      remoteId: Value(id),
      name: Value(name),
      parentId: Value(parentId),
      isActive: Value(isActive),
      updatedAt: Value(DateTime.now()),
      createdById: Value(''),
      createdAt: Value(DateTime.now()),
      deletedAt: Value(null),
    );
  }
}

extension ProductGroupIsarMapper on ProductGroupsDriftData {
  ProductGroup toEntity() {
    return ProductGroup(
      id: remoteId,
      name: name,
      parentId: parentId,
      isActive: isActive,
    );
  }
}



extension ProductDtoMapper on ProductDto {
  Product toEntity() {
    return Product(
      id: id,
      name: name,
      price: price,
      description: description,
      image: image,
      groupId: groupId,
      isActive: isActive,
      options: options.map((e) => e.toEntity()).toList(),
    );
  }

  ProductsDriftCompanion toDrift() {
    return ProductsDriftCompanion (
      remoteId: Value(id),
      name: Value(name),
      price: Value(price),
      description: Value(description),
      image: Value(image),
      groupId: Value(groupId),
      isActive: Value(isActive)
    );
  }
}

extension ProductIsarMapper on ProductsDriftData {
  Product toEntity() {
    return Product(
      id: remoteId,
      name: name,
      price: price,
      description: description,
      image: image,
      groupId: groupId,
      isActive: isActive
    );
  }
}