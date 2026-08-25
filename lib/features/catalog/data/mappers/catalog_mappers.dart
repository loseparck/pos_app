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
      description: description,
      sku: sku,
      additionalPrice: additionalPrice,
      taxRate: taxRate,
      image: image,
      color: color,
      active: active,
      inStock: inStock,
      displayOrder: displayOrder,
      icon: icon,
      optionId: option.id,
      createdAt: createdAt,
      createdById: createdById
    );
  }

  UpdateItemDto toUpdateDto() {
    return UpdateItemDto(
      name: name,
      description: description,
      sku: sku,
      additionalPrice: additionalPrice,
      taxRate: taxRate,
      image: image,
      color: color,
      active: active,
      inStock: inStock,
      displayOrder: displayOrder,
      icon: icon,
      optionId: option.id,
      updatedAt: DateTime.now(),
    );
  }

  ItemsDriftCompanion toDrift(String optionId) {
    return ItemsDriftCompanion(
      id: Value(id),
      name: Value(name),
      description:Value( description),
      sku: Value(sku),
      additionalPrice: Value(additionalPrice),
      taxRate: Value(taxRate),
      image: Value(image),
      color: Value(color),
      active: Value(active),
      inStock: Value(inStock),
      displayOrder: Value(displayOrder),
      icon: Value(icon),
      optionId: Value(option.id),
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
      description: description,
      sku: sku,
      additionalPrice: additionalPrice,
      taxRate: taxRate,
      image: image,
      color: color,
      active: active,
      inStock: inStock,
      displayOrder: displayOrder,
      icon: icon,
      option: option,
      createdAt: createdAt,
      createdById: createdById
    );
  }

  ItemsDriftCompanion toDrift() {
    return ItemsDriftCompanion(
      id: Value(id),
      name: Value(name),
      description:Value( description),
      sku: Value(sku),
      additionalPrice: Value(additionalPrice),
      taxRate: Value(taxRate),
      image: Value(image),
      color: Value(color),
      active: Value(active),
      inStock: Value(inStock),
      displayOrder: Value(displayOrder),
      icon: Value(icon),
      optionId: Value(optionId),
      createdAt: Value(createdAt ?? DateTime.now()),
      updatedAt: Value(DateTime.now()),
      createdById: Value(createdById)
    );
  }
}

extension ItemDriftMapper on ItemsDriftData {
  Item toEntity(Option option) {
    return Item(
      id: id,
      name: name,
      description: description,
      sku: sku,
      additionalPrice: additionalPrice,
      taxRate: taxRate,
      image: image,
      color: color,
      active: active,
      inStock: inStock,
      displayOrder: displayOrder,
      icon: icon,
      option: option,
      createdAt: createdAt,
      createdById: createdById,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }
}

//Mappers pour les Options
extension OptionMapper on Option {
  CreateOptionDto toCreateDto() {
    return CreateOptionDto(
      id: id,
      name: name,
      description: description,
      mandatory: mandatory,
      minSelection: minSelection,
      maxSelection: maxSelection,
      allowDuplicateSelection: allowDuplicateSelection,
      image: image,
      color: color,
      active: active,
      //items: items.map((e) => e.toCreateDto()).toList(),
      createdAt: createdAt,
      createdById: createdById
    );
  }

  UpdateOptionDto toUpdateDto() {
    return UpdateOptionDto(
      name: name,
      description: description,
      mandatory: mandatory,
      minSelection: minSelection,
      maxSelection: maxSelection,
      allowDuplicateSelection: allowDuplicateSelection,
      image: image,
      color: color,
      active: active,
      //items: items.map((e) => e.toCreateDto()).toList(),
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }

  OptionsDriftCompanion toDrift() {
    return OptionsDriftCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      mandatory: Value(mandatory),
      minSelection: Value(minSelection),
      maxSelection: Value(maxSelection),
      allowDuplicateSelection: Value(allowDuplicateSelection),
      image: Value(image),
      color: Value(color),
      active: Value(active),
      //items: items.map((e) => e.toCreateDto()).toList(),
      updatedAt: Value(DateTime.now()),
      createdAt: Value(createdAt ?? DateTime.now()),
      createdById: Value(createdById),
      deletedAt: Value(deletedAt),
    );  
  }
}

extension OptionDtoMapper on CreateOptionDto {
  Option toEntity() {
    return Option(
      id: id,
      name: name,
      description: description,
      mandatory: mandatory,
      minSelection: minSelection,
      maxSelection: maxSelection,
      allowDuplicateSelection: allowDuplicateSelection,
      image: image,
      color: color,
      active: active,
      items: [],
      createdAt: createdAt,
      createdById: createdById

      /*items: items.map((e) => e.toEntity(
        Option(
          name: name, 
          items: [], 
          id: id, 
          isMandatory: isMandatory,
          minToSelect: minToSelect,
          maxToSelect: maxToSelect,
          allowDuplicateSelection: multipleSelect,
          createdAt: createdAt,
          createdById: createdById
        )
      )).toList(),*/
    );
  }

  OptionsDriftCompanion toDrift() {
    return OptionsDriftCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      mandatory: Value(mandatory),
      minSelection: Value(minSelection),
      maxSelection: Value(maxSelection),
      allowDuplicateSelection: Value(allowDuplicateSelection),
      image: Value(image),
      color: Value(color),
      active: Value(active),
      //items: items.map((e) => e.toCreateDto()).toList(),
      updatedAt: Value(DateTime.now()),
      createdAt: Value(createdAt ?? DateTime.now()),
      createdById: Value(createdById),
    );
  }
}

extension OptionDriftMapper on OptionsDriftData {
  Option toEntity() {
    return Option(
      id: id,
      name: name,
      description: description,
      mandatory: mandatory,
      minSelection: minSelection,
      maxSelection: maxSelection,
      allowDuplicateSelection: allowDuplicateSelection,
      image: image,
      color: color,
      active: active,
      items: [],
      createdAt: createdAt,
      createdById: createdById,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }
}

//Mappers pour les Categories
extension CategoryMapper on Category {
  CreateCategoryDto toCreateDto() {
    return CreateCategoryDto(
      id: id,
      name: name,
      image: image,
      color: color,
      parentId: parent?.id,
      isActive: isActive,
      createdAt: createdAt,
      createdById: createdById
    );
  }

  UpdateCategoryDto toUpdateDto() {
    return UpdateCategoryDto(
      name: name,
      image: image,
      color: color,
      parentId: parent?.id,
      isActive: isActive,
      updatedAt:  DateTime.now(),
    );
  }

   CategoriesDriftCompanion toCompanion() {
    return CategoriesDriftCompanion(
      id: Value(id),
      name: Value(name),
      image: Value(image),
      color: Value(int.tryParse(color ?? '0')),
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
      image: image,
      color: color,
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
      image: Value(image),
      color: Value(int.tryParse(color ?? '0')),
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
      image: image,
      color: '$color',
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
      barcode: barcode,
      categoryId: category?.id,
      salePrice: salePrice,
      purchasePrice: purchasePrice,
      costPrice: costPrice,
      taxRate: taxRate,
      isActive: isActive,
      stockEnabled: stockEnabled,
      weighted: weighted,
      service: service,
      allowNegativeStock: allowNegativeStock,
      favorite: favorite,
      stockQuantity: stockQuantity,
      stockMin: stockMin,
      stockMax: stockMax,
      reorderPoint: reorderPoint,
      unit: unit,
      image: image,
      color: color,
      options: options?.map((option) => option.id).toList(),
      createdById: createdById,
      createdAt: createdAt,
    );
  }

  UpdateProductDto toUpdateDto() {
    return UpdateProductDto(
      name: name,
      description: description,
      sku: sku,
      barcode: barcode,
      categoryId: category?.id,
      salePrice: salePrice,
      purchasePrice: purchasePrice,
      costPrice: costPrice,
      taxRate: taxRate,
      isActive: isActive,
      stockEnabled: stockEnabled,
      weighted: weighted,
      service: service,
      favorite: favorite,
      allowNegativeStock: allowNegativeStock,
      stockQuantity: stockQuantity,
      stockMin: stockMin,
      stockMax: stockMax,
      reorderPoint: reorderPoint,
      unit: unit,
      image: image,
      color: color,
      options: options?.map((option) => option.id).toList(),
      updatedAt: updatedAt,
    );
  }

  ProductsDriftCompanion toCompanion() {
    return ProductsDriftCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      sku: Value(sku),
      barcode: Value(barcode),
      categoryId: Value(category?.id),
      salePrice: Value(salePrice),
      purchasePrice: Value(purchasePrice),
      costPrice: Value(costPrice),
      taxRate: Value(taxRate),
      stockEnabled: Value(stockEnabled),
      weighted: Value(weighted),
      service: Value(service),
      favorite: Value(favorite),
      allowNegativeStock: Value(allowNegativeStock),
      stockQuantity: Value(stockQuantity),
      stockMin: Value(stockMin),
      stockMax: Value(stockMax),
      reorderPoint: Value(reorderPoint),
      unit: Value(unit),
      image: Value(image),
      color: Value(color),
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
      barcode: barcode,
      category: category,
      salePrice: salePrice,
      purchasePrice: purchasePrice,
      costPrice: costPrice,
      taxRate: taxRate,
      isActive: isActive,
      stockEnabled: stockEnabled,
      weighted: weighted,
      service: service,
      favorite: favorite,
      allowNegativeStock: allowNegativeStock,
      stockQuantity: stockQuantity,
      stockMin: stockMin,
      stockMax: stockMax,
      reorderPoint: reorderPoint,
      unit: unit,
      image: image,
      color: color,
      options: options?.map((option) => Option(name: '', items: [], id: option)).toList(),
      createdById: createdById,
      createdAt: createdAt,
    );
  }

  ProductsDriftCompanion toDrift() {
    return ProductsDriftCompanion (
      id: Value(id),
      name: Value(name),
      description: Value(description),
      sku: Value(sku),
      barcode: Value(barcode),
      categoryId: Value(categoryId),
      salePrice: Value(salePrice),
      purchasePrice: Value(purchasePrice),
      costPrice: Value(costPrice),
      taxRate: Value(taxRate),
      stockEnabled: Value(stockEnabled),
      weighted: Value(weighted),
      service: Value(service),
      favorite: Value(favorite),
      allowNegativeStock: Value(allowNegativeStock),
      stockQuantity: Value(stockQuantity),
      stockMin: Value(stockMin),
      stockMax: Value(stockMax),
      reorderPoint: Value(reorderPoint),
      unit: Value(unit),
      image: Value(image),
      color: Value(color),
      isActive: Value(isActive),
      updatedAt: Value(DateTime.now()),
      createdById: Value(createdById),
      createdAt: Value(DateTime.now())      
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
      barcode: barcode,
      category: category,
      salePrice: salePrice ?? 0,
      purchasePrice: purchasePrice,
      costPrice: costPrice,
      taxRate: taxRate ?? 20,
      isActive: isActive,
      stockEnabled: stockEnabled,
      weighted: weighted,
      service: service,
      favorite: favorite,
      allowNegativeStock: allowNegativeStock,
      stockQuantity: stockQuantity,
      stockMin: stockMin,
      stockMax: stockMax,
      reorderPoint: reorderPoint,
      unit: unit,
      image: image,
      color: color,
      createdById: createdById,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }

  Product toEntityWithOption(Category? category, List<Option> options) {
    return Product(
      id: id,
      name: name,
      description: description,
      sku: sku,
      barcode: barcode,
      category: category,
      salePrice: salePrice ?? 0,
      purchasePrice: purchasePrice,
      costPrice: costPrice,
      taxRate: taxRate ?? 20,
      isActive: isActive,
      stockEnabled: stockEnabled,
      weighted: weighted,
      service: service,
      favorite: favorite,
      allowNegativeStock: allowNegativeStock,
      stockQuantity: stockQuantity,
      stockMin: stockMin,
      stockMax: stockMax,
      reorderPoint: reorderPoint,
      unit: unit,
      image: image,
      color: color,
      createdById: createdById,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
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
      value: Value(value),
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
      value: Value(value),
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
      discountType: $enumDecodeNullable(discountTypeEnumMap, discountType) ?? DiscountType.fixed,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      createdById: createdById,
    );
  }
}
