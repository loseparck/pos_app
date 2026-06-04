import 'package:pos_app/data/local/db/app_database.dart';
import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pos_app/features/orders/data/models/dto/create_order_dto.dart';
import 'package:pos_app/features/orders/data/models/dto/create_order_item_dto.dart';
import 'package:pos_app/features/orders/data/models/dto/create_order_item_option_dto.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';
import 'package:pos_app/features/orders/domain/entities/order_item.dart';
import 'package:pos_app/features/orders/domain/entities/order_item_option.dart';
import 'package:pos_app/features/orders/domain/enums/order_status.dart';
import 'package:pos_app/features/payments/domain/entities/payment.dart';


extension OrderMapper on Order {
  CreateOrderDto toCreateDto() {
    return CreateOrderDto(
      id: id,
      tableId: tableId,
      groupId: groupId,
      createdAt: createdAt ?? DateTime.now(),
      createdById: createdById,
      items: items.map((elem) => elem.toCreateDto()).toList(),
      status: status,
    );
  }

  OrderDriftCompanion toDrift() {
    return OrderDriftCompanion(
      id: Value(id),
      tableId: Value(tableId ?? ""),
      groupId: Value(groupId ?? ""),
      status: Value(orderStatusEnumMap[status] ?? 'draft'),
      createdAt: Value(createdAt ?? DateTime.now()),
      updatedAt: Value(DateTime.now()),
      deletedAt: Value(deletedAt),
      createdById: Value(createdById),
      paymentId: Value(''),
    );
  }
}

extension CreateOrderDtoMapper on CreateOrderDto {
  Order toEntity() {
    return Order(
      id: id,
      tableId: tableId,
      groupId: groupId,
      createdAt: createdAt,
      createdById: createdById,
      items: items.map((elem) => elem.toEntity()).toList(),
      status: status,
    );
  }

  OrderDriftCompanion toDrift() {
    return OrderDriftCompanion(
      id: Value(id),
      tableId: Value(tableId ?? ""),
      groupId: Value(groupId ?? ""),
      createdAt:  Value(createdAt ?? DateTime.now()),
      createdById:  Value(createdById),
      updatedAt:  Value(DateTime.now()),
    );
  }
}

extension OrderDriftMapper on OrderDriftData {
  Order toEntity({List<OrderItem>? items, Payment? payment}) {
    return Order(
      id: id,
      tableId: tableId,
      groupId: groupId,
      items: items ?? [],
      payment: payment,
      status:  $enumDecodeNullable(orderStatusEnumMap, status) ?? OrderStatus.draft,
      createdAt: createdAt,
      createdById: createdById,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }
}

//Mappers pour les OrderItem
extension OrderItemMapper on OrderItem {
  CreateOrderItemDto toCreateDto() {
    return CreateOrderItemDto(
      id: id,
      orderId: orderId,
      productId: productId,
      productName: productName,
      comment: comment,
      quantity: quantity,
      unitPrice: unitPrice,
      vat: vat,
      status: status,
      options: options.map((e) => e.toCreateDto()).toList(),
      createdAt: createdAt ?? DateTime.now(),
      createdById: createdById
    );
  }

  OrderItemDriftCompanion toDrift() {
    return OrderItemDriftCompanion(
      id: Value(id),
      orderId: Value(orderId),
      productId: Value(productId),
      productName: Value(productName),
      comment: Value(comment ?? ""),
      quantity: Value(quantity),
      unitPrice: Value(unitPrice),
      vat: Value(vat),
      status: Value(orderStatusEnumMap[status] ?? 'draft'),
      createdAt: Value(createdAt ?? DateTime.now()),
      updatedAt: Value(DateTime.now()),
      deletedAt: Value(deletedAt),
      createdById: Value(createdById)
    );  
  }
}

extension OrderItemDtoMapper on CreateOrderItemDto {
  OrderItem toEntity({List<OrderItemOption>? options}) {
    return OrderItem(
      id: id,
      orderId: orderId,
      productId: productId ?? "",
      productName: productName,
      comment: comment,
      quantity: quantity,
      unitPrice: unitPrice,
      vat: vat,
      options: options ?? [],
      status: status,
      validatedAt: validatedAt,
      createdAt: createdAt,
      createdById: createdById
    );
  }

  OrderItemDriftCompanion toDrift() {
    return OrderItemDriftCompanion(
      id: Value(id),
      orderId: Value(orderId),
      productId: Value(productId),
      productName: Value(productName),
      comment: Value(comment),
      quantity: Value(quantity),
      unitPrice: Value(unitPrice),
      vat: Value(vat),
      status: Value(orderStatusEnumMap[status] ?? 'draft'),
      validatedAt: Value(validatedAt ?? DateTime.now()),
      createdAt: Value(createdAt),
      createdById: Value(createdById),
    );
  }
}

extension OrderItemDriftMapper on OrderItemDriftData {
  OrderItem toEntity({List<OrderItemOption> ? options}) {
    return OrderItem(
      id: id,
      orderId: orderId,
      productId: productId ?? "",
      productName: productName,
      comment: comment,
      quantity: quantity,
      unitPrice: unitPrice,
      vat: vat,
      options: options ?? [],
      status: $enumDecodeNullable(orderStatusEnumMap, status) ?? OrderStatus.draft,
      validatedAt: validatedAt,
      createdAt: createdAt,
      createdById: createdById
    );
  }
}

//Mappers pour les OrderITem Option
extension OrderItemOptionMapper on OrderItemOption {
  CreateOrderItemOptionDto toCreateDto() {
    return CreateOrderItemOptionDto(
      id: id,
      orderItemId: orderItemId,
      optionId: optionId,
      optionName: optionName,
      quantity: quantity,
      unitPrice: unitPrice,
      vat: vat,
      createdAt: createdAt ?? DateTime.now(),
      createdById: createdById
    );
  }

  OrderItemOptionsDriftCompanion toDrift() {
    return OrderItemOptionsDriftCompanion(
      id: Value(id),
      orderItemId: Value(orderItemId),
      optionId: Value(optionId),
      optionName: Value(optionName),
      quantity: Value(quantity),
      unitPrice: Value(unitPrice),
      vat: Value(vat),
      updatedAt: Value(DateTime.now()),
      createdById: Value(createdById),
      createdAt: Value(createdAt ?? DateTime.now()),
      deletedAt: Value(deletedAt),
    );
  }
}

extension OrderItemOptionDtoMapper on CreateOrderItemOptionDto {
  OrderItemOption toEntity() {
    return OrderItemOption(
      id: id,
      orderItemId: orderItemId,
      optionId: optionId,
      optionName: optionName,
      quantity: quantity,
      unitPrice: unitPrice,
      vat: vat,
      createdAt: createdAt,
      createdById: createdById
    );
  }

   OrderItemOptionsDriftCompanion toDrift() {
    return OrderItemOptionsDriftCompanion(
      id: Value(id),
      orderItemId: Value(orderItemId),
      optionId: Value(optionId),
      optionName: Value(optionName),
      quantity: Value(quantity),
      unitPrice: Value(unitPrice),
      vat: Value(vat),
      createdById: Value(createdById),
      createdAt: Value(createdAt),
    );
  }
}

extension OrderItemOptionsDriftCompanionsarMapper on OrderItemOptionsDriftData {
  OrderItemOption toEntity() {
    return OrderItemOption(
      id: id,
      orderItemId:orderItemId,
      optionId: optionId,
      optionName: optionName,
      quantity: quantity,
      unitPrice: unitPrice,
      vat: vat,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      createdById: createdById,
    );
  }
} 
