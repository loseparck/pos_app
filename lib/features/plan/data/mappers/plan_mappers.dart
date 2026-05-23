import 'package:drift/drift.dart';
import 'package:pos_app/data/local/db/app_database.dart';
import 'package:pos_app/features/plan/data/models/dto/create_plan_dto.dart';
import 'package:pos_app/features/plan/data/models/dto/create_restaurant_table_dto.dart';
import 'package:pos_app/features/plan/data/models/dto/update_plan_dto.dart';
import 'package:pos_app/features/plan/data/models/dto/update_restaurant_table_dto.dart';
import 'package:pos_app/features/plan/domain/entities/plan.dart';
import 'package:pos_app/features/plan/domain/entities/restaurant_table.dart';
import 'package:json_annotation/json_annotation.dart';

//Mappers pour les Categories
extension PlanMapper on Plan {
  CreatePlanDto toCreateDto() {
    return CreatePlanDto(
      id: id,
      name: name,
      createdAt: createdAt,
      createdById: createdById
    );
  }

  UpdatePlanDto toUpdateDto() {
    return UpdatePlanDto(
      id: id,
      name: name,
      updatedAt:  DateTime.now(),
    );
  }

  PlanDriftCompanion toCompanion() {
    return PlanDriftCompanion(
      id: Value(id),
      name: Value(name),
      updatedAt: Value(DateTime.now()),
      createdById: Value(createdById),
      createdAt: Value(createdAt ?? DateTime.now()),
      deletedAt: Value(deletedAt),
    );
  }
}

extension PlanDtoMapper on CreatePlanDto {
  Plan toEntity() {
    return Plan(
      id: id,
      name: name,
      createdAt: createdAt,
      createdById: createdById
    );
  }

  /*CategoriesDriftCompanion toDrift() {
    return CategoriesDriftCompanion(
      id: Value(id),
      name: Value(name),
      parentId: Value(parentId),
      isActive: Value(isActive),
      updatedAt: Value(DateTime.now()),
      createdById: Value(createdById),
      createdAt: Value(createdAt ?? DateTime.now()),
    );
  }*/
}

extension PlanIsarMapper on PlanDriftData {
  Plan toEntity() {
    return Plan(
      id: id,
      name: name,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      createdById: createdById,
    );
  }
}


//Mappers pour les Produits
extension RestaurantTableMapper on RestaurantTable {
  CreateRestaurantTableDto toCreateDto() {
    return CreateRestaurantTableDto(
      id: id,
      name: name,
      x: x,
      y: y,
      seats: seats,
      status: status,
      color: '$color',
      rotation: rotation,
      shape: shape,
      width: width,
      height: height,
      planId: plan.id,
      createdAt: createdAt,
      createdById: createdById,
    );
  }

  UpdateRestaurantTableDto toUpdateDto() {
    return UpdateRestaurantTableDto(
      id: id,
      name: name,
      x: x,
      y: y,
      seats: seats,
      status: status,
      color: '$color',
      rotation: rotation,
      shape: shape,
      width: width,
      height: height,
      planId: plan.id,
      updatedAt:  DateTime.now(),
    );
  }

  RestaurantTableDriftCompanion toCompanion() {
    return RestaurantTableDriftCompanion(
      id: Value(id),
      name: Value(name),
      x: Value(y),
      y: Value(x),
      seats: Value(seats),
      status: Value(tableStatusEnumMap[status] ?? 'empty'),
      color: Value(int.tryParse(color ?? '0') ?? 0),
      rotation: Value(rotation),
      shape: Value(tableShapeEnumMap[shape] ?? 'circle'),
      width: Value(width),
      height: Value(height),
      planId: Value(plan.id),
      updatedAt: Value(DateTime.now()),
      createdById: Value(createdById),
      createdAt: Value(DateTime.now()),
      deletedAt: Value(deletedAt),
    );
  }
}

extension RestaurantTableDtoMapper on CreateRestaurantTableDto {
  RestaurantTable toEntity() {
    return RestaurantTable(
      id: id,
      name: name,
      x: x,
      y: y,
      seats: seats,
      status: status,
      color:color,
      rotation: rotation,
      shape: shape,
      width: width,
      height: height,
      plan: Plan(id: planId, name: ''),
      createdAt: createdAt,
      createdById: createdById,
    );
  }

  RestaurantTableDriftCompanion toDrift() {
    return RestaurantTableDriftCompanion (
      id: Value(id),
      name: Value(name),
      x: Value(y),
      y: Value(x),
      seats: Value(seats),
      status: Value(tableStatusEnumMap[status] ?? 'empty'),
      color: Value(int.tryParse(color ?? '0')),
      rotation: Value(rotation),
      shape: Value(tableShapeEnumMap[shape] ?? 'circle'),
      width: Value(width),
      height: Value(height),
      planId: Value(planId),
      updatedAt: Value(DateTime.now()),
      createdById: Value(createdById),
      createdAt: Value(DateTime.now()),
    );
  }
}

extension RestaurantTableIsarMapper on RestaurantTableDriftData {
  RestaurantTable toEntity() {
    return RestaurantTable(
      id: id,
      name: name,
      x: x,
      y: y,
      seats: seats,
      status: $enumDecodeNullable(tableStatusEnumMap, status) ?? TableStatus.empty,
      color: '$color',
      rotation: rotation,
      shape:  $enumDecodeNullable(tableShapeEnumMap, shape) ?? TableShape.circle,
      width: width,
      height: height,
      plan: Plan(id: planId ?? '', name: ''),
      createdAt: createdAt,
      createdById: createdById,
      updatedAt: updatedAt,
    );
  }
}