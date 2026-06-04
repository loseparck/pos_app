import 'package:pos_app/data/local/db/app_database.dart';
import 'package:drift/drift.dart';
import 'package:pos_app/features/catalog/data/models/dto/create_category_dto.dart';
import 'package:pos_app/features/catalog/data/models/dto/create_discount_dto.dart';
import 'package:pos_app/features/catalog/data/models/dto/update_category_dto.dart';
import 'package:pos_app/features/catalog/data/models/dto/update_discount_dto.dart';
import 'package:pos_app/features/catalog/data/models/dto/update_item_dto.dart';
import 'package:pos_app/features/catalog/data/models/dto/update_option_dto.dart';
import 'package:pos_app/features/catalog/data/models/dto/update_product_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/discount.dart';
import '../../domain/entities/item.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/option.dart';

import '../models/dto/create_item_dto.dart';
import '../models/dto/create_product_dto.dart';
import '../models/dto/create_option_dto.dart';

extension ItemMapper on Item {
  CreateItemDto toCreateDto() {
    return CreateItemDto(
      id: id,
      name: name,
      price: price,
      optionId: option.id,
      vat: vat,
      isActive: isActive,
      createdAt: createdAt,
      createdById: createdById
    );
  }

  UpdateItemDto toUpdateDto() {
    return UpdateItemDto(
      name: name,
      price: price,
      vat: vat,
      isActive: isActive,
      updatedAt: DateTime.now(),
    );
  }

  ItemsDriftCompanion toDrift(String optionId) {
    return ItemsDriftCompanion(
      id: Value(id),
      name: Value(name),
      price: Value(price),
      optionId:  Value(optionId),
      vat: Value(vat),
      isActive: Value(isActive),
      //optionId: Value(optionLocalId),
      createdAt: Value(createdAt ?? DateTime.now()),
      updatedAt: Value(DateTime.now()),
      deletedAt: Value(deletedAt),
      createdById: Value(createdById)
    );
  }
}

extension CreateItemDtoMapper on CreateItemDto {
  Item toEntity(Option option) {
    return Item(
      id: id,
      name: name,
      price: price,
      vat: vat,
      isActive: isActive,
      option: option,
      createdAt: createdAt,
      createdById: createdById
    );
  }

  ItemsDriftCompanion toDrift() {
    return ItemsDriftCompanion(
      id: Value(id),
      name: Value(name),
      price: Value(price),
      vat: Value(vat),
      isActive:  Value(isActive),
      optionId:  Value(optionId),
      createdAt:  Value(createdAt ?? DateTime.now()),
      createdById:  Value(createdById),
      updatedAt:  Value(DateTime.now()),
    );
  }
}

extension ItemDriftMapper on ItemsDriftData {
  Item toEntity(Option option) {
    return Item(
      id: id,
      name: name,
      price: price,
      option: option,
      isActive: isActive,
      vat: vat ?? 0,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      createdById: createdById,
    );
  }
}

//Mappers pour les Options
extension OptionMapper on Option {
  CreateOptionDto toCreateDto() {
    return CreateOptionDto(
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

  UpdateOptionDto toUpdateDto() {
    return UpdateOptionDto(
      name: name,
      isMandatory: isMandatory,
      minToSelect: minToSelect,
      maxToSelect: maxToSelect,
      multipleSelect: multipleSelect,
      isActive: isActive,
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }

  OptionsDriftCompanion toDrift() {
    return OptionsDriftCompanion(
      id: Value(id),
      name: Value(name),
      isMandatory: Value(isMandatory),
      minToSelect: Value(minToSelect),
      maxToSelect: Value(maxToSelect),
      multipleSelect: Value(multipleSelect),
      isActive: Value(isActive),
      createdAt: Value(createdAt ?? DateTime.now()),
      updatedAt: Value(DateTime.now()),
      deletedAt: Value(deletedAt),
      createdById: Value(createdById)
    );  
  }
}

extension OptionDtoMapper on CreateOptionDto {
  Option toEntity() {
    return Option(
      id: id,
      name: name,
      isMandatory: isMandatory,
      minToSelect: minToSelect,
      maxToSelect: maxToSelect,
      multipleSelect: multipleSelect,
      items: items.map((e) => e.toEntity(
        Option(
          name: name, 
          items: [], 
          id: id, 
          isMandatory: isMandatory,
          minToSelect: minToSelect,
          maxToSelect: maxToSelect,
          multipleSelect: multipleSelect,
          createdAt: createdAt,
          createdById: createdById
        )
      )).toList(),
      createdAt: createdAt,
      createdById: createdById
    );
  }

  OptionsDriftCompanion toDrift() {
    return OptionsDriftCompanion(
      id: Value(id),
      name: Value(name),
      isMandatory: Value(isMandatory),
      minToSelect: Value(minToSelect),
      maxToSelect: Value(maxToSelect),
      multipleSelect: Value(multipleSelect),
    );
  }
}

extension OptionDriftMapper on OptionsDriftData {
  Option toEntity() {
    return Option(
      id: id,
      name: name,
      isMandatory: isMandatory,
      minToSelect: minToSelect,
      maxToSelect: maxToSelect,
      multipleSelect: multipleSelect,
      items: [],
      
    );
  }
}

//Mappers pour les Categories
extension CategoryMapper on Category {
  CreateCategoryDto toCreateDto() {
    return CreateCategoryDto(
      id: id,
      name: name,
      parentId: parent?.id,
      isActive: isActive,
      createdAt: createdAt,
      createdById: createdById
    );
  }

  UpdateCategoryDto toUpdateDto() {
    return UpdateCategoryDto(
      name: name,
      parentId: parent?.id,
      isActive: isActive,
      updatedAt:  DateTime.now(),
    );
  }

   CategoriesDriftCompanion toCompanion() {
    return CategoriesDriftCompanion(
      id: Value(id),
      name: Value(name),
      parentId: Value(parent?.id),
      isActive: Value(isActive),
      updatedAt: Value(DateTime.now()),
      createdById: Value(createdById),
      createdAt: Value(DateTime.now()),
      deletedAt: Value(deletedAt),
    );
  }
}

extension CategoryDtoMapper on CreateCategoryDto {
  Category toEntity(Category category) {
    return Category(
      id: id,
      name: name,
      parent: category,
      isActive: isActive,
      createdAt: createdAt,
      createdById: createdById
    );
  }

   CategoriesDriftCompanion toDrift() {
    return CategoriesDriftCompanion(
      id: Value(id),
      name: Value(name),
      parentId: Value(parentId),
      isActive: Value(isActive),
      updatedAt: Value(DateTime.now()),
      createdById: Value(createdById),
      createdAt: Value(createdAt ?? DateTime.now()),
    );
  }
}

extension CategoryIsarMapper on CategoriesDriftData {
  Category toEntity(Category? category) {
    return Category(
      id: id,
      name: name,
      parent: category,
      parentId: category?.id,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      createdById: createdById,
    );
  }
}


//Mappers pour les Produits
extension ProductMapper on Product {
  CreateProductDto toCreateDto() {
    return CreateProductDto(
      id: id,
      name: name,
      description: description,
      sku: sku,
      price: price,
      vat: vat,
      stockQuantity: stockQuantity,
      color: color,
      categoryId: category?.id,
      codeBarres: codeBarres,
      isActive: isActive,
      options: options?.map((option) => option.id).toList(),
      createdAt: createdAt,
      createdById: createdById,
    );
  }

  UpdateProductDto toUpdateDto() {
    return UpdateProductDto(
      name: name,
      description: description,
      sku: sku,
      price: price,
      vat: vat,
      stockQuantity: stockQuantity,
      color: color,
      categoryId: category?.id,
      codeBarres: codeBarres,
      isActive: isActive,
      options: options?.map((option) => option.id).toList(),
      updatedAt:  DateTime.now(),
    );
  }

  ProductsDriftCompanion toCompanion() {
    return ProductsDriftCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      sku: Value(sku),
      price: Value(price),
      vat: Value(vat),
      stockQuantity: Value(stockQuantity),
      image: Value(image),
      color: Value(color),
      categoryId: Value(category?.id),
      codeBarres: Value(codeBarres),
      isActive: Value(isActive),
      updatedAt: Value(DateTime.now()),
      createdById: Value(createdById),
      createdAt: Value(DateTime.now()),
      deletedAt: Value(deletedAt),
    );
  }
}

extension ProductDtoMapper on CreateProductDto {
  Product toEntity(Category? category) {
    return Product(
      id: id,
      name: name,
      description: description,
      sku: sku,
      price: price,
      vat: vat ?? 0,
      stockQuantity: stockQuantity,
      color: color,
      category: category,
      codeBarres: codeBarres,
      isActive: isActive,
      options: options?.map((option) => Option(name: '', items: [], id: option)).toList(),
      createdAt: createdAt,
      createdById: createdById,
    );
  }

  ProductsDriftCompanion toDrift() {
    return ProductsDriftCompanion (
      id: Value(id),
      name: Value(name),
      description: Value(description),
      sku: Value(sku),
      price: Value(price),
      vat: Value(vat),
      stockQuantity: Value(stockQuantity),
      color: Value(color),
      categoryId: Value(categoryId),
      codeBarres: Value(codeBarres),
      isActive: Value(isActive),
      updatedAt: Value(DateTime.now()),
      createdById: Value(createdById),
      createdAt: Value(DateTime.now()),
    );
  }
}

extension ProductIsarMapper on ProductsDriftData {
  Product toEntity(Category? category) {
    return Product(
       id: id,
      name: name,
      description: description,
      sku: sku,
      price: price,
      vat: vat ?? 0,
      stockQuantity: stockQuantity,
      image: image,
      color: color,
      category: category,
      codeBarres: codeBarres,
      isActive: isActive,
      createdAt: createdAt,
      createdById: createdById,
    );
  }
  Product toEntityWithOption(Category? category, List<Option> options) {
    return Product(
       id: id,
      name: name,
      description: description,
      sku: sku,
      price: price,
      vat: vat ?? 0,
      stockQuantity: stockQuantity,
      image: image,
      color: color,
      category: category,
      codeBarres: codeBarres,
      isActive: isActive,
      createdAt: createdAt,
      createdById: createdById,
      options: options
    );
  }
}

//Mappers pour les Reductions
extension DiscountMapper on Discount {
  CreateDiscountDto toCreateDto() {
    return CreateDiscountDto(
      id: id,
      name: name,
      value: value,
      discountType: discountType,
      isActive: isActive,
      createdAt: createdAt,
      createdById: createdById
    );
  }

  UpdateDiscountDto toUpdateDto() {
    return UpdateDiscountDto(
      name: name,
      isActive: isActive,
      updatedAt:  DateTime.now(),
    );
  }

  DiscountsDriftCompanion toCompanion() {
    return DiscountsDriftCompanion(
      id: Value(id),
      name: Value(name),
      value: Value(value ?? 0),
      discountType: Value(discountTypeEnumMap[discountType] ?? 'amount'),
      isActive: Value(isActive),
      updatedAt: Value(DateTime.now()),
      createdById: Value(createdById),
      createdAt: Value(DateTime.now()),
      deletedAt: Value(deletedAt),
    );
  }
}

extension DiscountDtoMapper on CreateDiscountDto {
  Discount toEntity(Category category) {
    return Discount(
      id: id,
      name: name,
      value: value,
      discountType: discountType,
      isActive: isActive,
      createdAt: createdAt,
      createdById: createdById
    );
  }

  DiscountsDriftCompanion toDrift() {
    return DiscountsDriftCompanion(
      id: Value(id),
      name: Value(name),
      value: Value(value ?? 0),
      discountType: Value(discountTypeEnumMap[discountType] ?? 'amount'),
      isActive: Value(isActive),
      updatedAt: Value(DateTime.now()),
      createdById: Value(createdById),
      createdAt: Value(createdAt ?? DateTime.now()),
    );
  }
}

extension DiscountIsarMapper on DiscountsDriftData {
  Discount toEntity() {
    return Discount(
      id: id,
      name: name,
      value: value,
      discountType: $enumDecodeNullable(discountTypeEnumMap, discountType) ?? DiscountType.amount,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      createdById: createdById,
    );
  }
}
