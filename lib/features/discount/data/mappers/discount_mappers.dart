import 'package:pos_app/data/local/db/app_database.dart';
import 'package:drift/drift.dart';
import 'package:pos_app/features/discount/data/models/dto/create_discount_dto.dart';
import 'package:pos_app/features/discount/data/models/dto/optional.dart';
import 'package:pos_app/features/discount/data/models/dto/update_discount_dto.dart';
import '../../domain/entities/discount.dart';


extension DiscountMapper on Discount {
  CreateDiscountDto toCreateDto() {
    return CreateDiscountDto(
      id: id,
      name: name,
      description: description,
      type: type,
      activation: activation,
      code: code,
      scope: scope,

      productIds: Set<String>.from(productIds),
      categoryIds: Set<String>.from(categoryIds),

      value: value,
      quantityPromotion: quantityPromotion,
      minimumAmount: minimumAmount,
      minimumQuantity: minimumQuantity,
      maximumDiscount: maximumDiscount,

      usageLimit: usageLimit,
      startDate: startDate,
      endDate: endDate,

      daysOfWeek: List<int>.from(daysOfWeek),
      startTime: startTime,
      endTime: endTime,
      combinable: combinable,
      priority: priority,
      isActive: isActive,
      createdAt: createdAt,
    );
  }

  UpdateDiscountDto toUpdateDto() {
    return UpdateDiscountDto(
      name:
          Optional.value(name),

      description:
          description == null
              ? const Optional.nullValue()
              : Optional.value(description!),

      type:
          Optional.value(type),

      activation:
          Optional.value(activation),

      code:
          code == null
              ? const Optional.nullValue()
              : Optional.value(code!),

      scope:
          Optional.value(scope),

      productIds:
          Optional.value(
            Set<String>.from(productIds),
          ),

      categoryIds:
          Optional.value(
            Set<String>.from(categoryIds),
          ),

      value:
          value == null
              ? const Optional.nullValue()
              : Optional.value(value!),

      quantityPromotion:
          quantityPromotion == null
              ? const Optional.nullValue()
              : Optional.value(
                  quantityPromotion!,
                ),

      minimumAmount:
          minimumAmount == null
              ? const Optional.nullValue()
              : Optional.value(
                  minimumAmount!,
                ),

      minimumQuantity:
          minimumQuantity == null
              ? const Optional.nullValue()
              : Optional.value(
                  minimumQuantity!,
                ),

      maximumDiscount:
          maximumDiscount == null
              ? const Optional.nullValue()
              : Optional.value(
                  maximumDiscount!,
                ),

      usageLimit:
          usageLimit == null
              ? const Optional.nullValue()
              : Optional.value(
                  usageLimit!,
                ),

      startDate:
          startDate == null
              ? const Optional.nullValue()
              : Optional.value(startDate!),

      endDate:
          endDate == null
              ? const Optional.nullValue()
              : Optional.value(endDate!),

      daysOfWeek:
          Optional.value(
            List<int>.from(daysOfWeek),
          ),

      startTime:
          startTime == null
              ? const Optional.nullValue()
              : Optional.value(startTime!),

      endTime:
          endTime == null
              ? const Optional.nullValue()
              : Optional.value(endTime!),

      combinable:
          Optional.value(combinable),

      priority:
          Optional.value(priority),

      isActive:
          Optional.value(isActive),

      updatedAt:
          updatedAt,
    );
  }

  DiscountsDriftCompanion toCompanion() {
    return DiscountsDriftCompanion(
      // --------------------------------------------------------
      // Identité
      // --------------------------------------------------------

      id: Value(id),
      name: Value(name),
      description: Value(description),

      type: Value(type.name),
      activation: Value(activation.name),
      code: Value(code),
      scope: Value(scope.name),
      productIds: Value(productIds.join(',')),
      categoryIds: Value(categoryIds.join(',')),
      value: Value(value),
      minimumAmount: Value(minimumAmount),
      maximumDiscount: Value(maximumDiscount),

      quantityTrigger: Value( quantityPromotion?.triggerQuantity, ),
      quantityReward: Value(quantityPromotion?.rewardQuantity),
      quantityRewardType: Value(quantityPromotion?.rewardType.name),
      quantityRewardValue: Value(quantityPromotion?.rewardValue,),
      quantityBundlePrice: Value(quantityPromotion?.bundlePrice),
      minimumQuantity: Value(minimumQuantity),

      usageLimit: Value( usageLimit),
      usageCount: Value(usageCount),
      
      startDate: Value(startDate),
      endDate: Value(endDate),
      daysOfWeek: Value(daysOfWeek.join(',')),
      startTime: Value(startTime),
      endTime: Value(endTime),

      combinable: Value(combinable),
      priority: Value(priority),

      isActive: Value(isActive),

      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: Value(deletedAt),
      firstUsedAt: Value(firstUsedAt),
      lastUsedAt: Value(lastUsedAt),
    );
  }

}

extension DiscountDriftMapper on DiscountsDriftData {
  Discount toEntity() {
    return Discount(
      id: id,
      name: name,
      description: description,

      type: DiscountType.values.firstWhere((value) => value.name == type, orElse: () => DiscountType.percentage),

      activation:
          DiscountActivation.values.firstWhere(
        (value) => value.name == activation,
        orElse: () => DiscountActivation.manual,
      ),

      code: code,

      scope: DiscountScope.values.firstWhere(
        (value) => value.name == scope,
        orElse: () => DiscountScope.order,
      ),

      productIds: productIds.split(',').toSet(),
      categoryIds: categoryIds.split(',').toSet(),

      value: value,
      minimumAmount: minimumAmount,
      maximumDiscount: maximumDiscount,

      quantityPromotion: _buildQuantityPromotion(),
      minimumQuantity: minimumQuantity,
      usageLimit: usageLimit,
      usageCount: usageCount,

      startDate: startDate,
      endDate: endDate,
      daysOfWeek:_parseDaysOfWeek(daysOfWeek),
      startTime: startTime,
      endTime: endTime,

      combinable: combinable,
      priority: priority,
      isActive: isActive,

      createdAt:createdAt,
      updatedAt:updatedAt,
      deletedAt:deletedAt,

      firstUsedAt: firstUsedAt,
      lastUsedAt: lastUsedAt,
    );
  }

  QuantityPromotion? _buildQuantityPromotion() {
    final hasPromotion =
        quantityTrigger != null ||
        quantityReward != null ||
        quantityRewardType != null ||
        quantityRewardValue != null ||
        quantityBundlePrice != null;

    if (!hasPromotion) {
      return null;
    }

    return QuantityPromotion(
      triggerQuantity: quantityTrigger ?? 0,
      rewardQuantity: quantityReward ?? 0,
      rewardType:
          QuantityRewardType.values.firstWhere(
        (value) =>
            value.name == quantityRewardType,
        orElse: () => QuantityRewardType.free,
      ),

      rewardValue: quantityRewardValue,
      bundlePrice: quantityBundlePrice,
    );
  }

  static List<int> _parseDaysOfWeek(
    String value,
  ) {
    if (value.trim().isEmpty) {
      return const [];
    }

    return value
        .split(',')
        .map(
          (item) => int.tryParse(item.trim()),
        )
        .whereType<int>()
        .toList();
  }
}

extension CreateDiscountDtoMapper on CreateDiscountDto {
  Discount toEntity() {
    return Discount(
      id: id,
      name: name,
      description: description,
      type: type,
      activation: activation,
      code: code,
      scope: scope,
      productIds:
          Set<String>.from(productIds),
      categoryIds:
          Set<String>.from(categoryIds),
      value: value,
      quantityPromotion:
          quantityPromotion,
      minimumAmount: minimumAmount,
      minimumQuantity: minimumQuantity,
      maximumDiscount: maximumDiscount,
      usageLimit: usageLimit,
      usageCount: 0,
      firstUsedAt: null,
      lastUsedAt: null,
      startDate: startDate,
      endDate: endDate,
      daysOfWeek: List<int>.from(daysOfWeek),
      startTime: startTime,
      endTime: endTime,
      combinable: combinable,
      priority: priority,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: createdAt,
      deletedAt: null,
    );
  }
}

extension UpdateDiscountEntityMapper
    on UpdateDiscountDto {
  Discount applyTo(
    Discount current,
  ) {
    return Discount(
      // ========================================================
      // IMMUTABLE
      // ========================================================

      id:
          current.id,

      createdAt:
          current.createdAt,

      usageCount:
          current.usageCount,

      firstUsedAt:
          current.firstUsedAt,

      lastUsedAt:
          current.lastUsedAt,

      deletedAt:
          current.deletedAt,

      // ========================================================
      // MODIFIABLE
      // ========================================================

      name:
          name.isSet
              ? name.value!
              : current.name,

      description:
          description.isSet
              ? description.value
              : current.description,

      type:
          type.isSet
              ? type.value!
              : current.type,

      activation:
          activation.isSet
              ? activation.value!
              : current.activation,

      code:
          code.isSet
              ? code.value
              : current.code,

      scope:
          scope.isSet
              ? scope.value!
              : current.scope,

      productIds:
          productIds.isSet
              ? Set<String>.from(
                  productIds.value!,
                )
              : current.productIds,

      categoryIds:
          categoryIds.isSet
              ? Set<String>.from(
                  categoryIds.value!,
                )
              : current.categoryIds,

      value:
          value.isSet
              ? value.value
              : current.value,

      quantityPromotion:
          quantityPromotion.isSet
              ? quantityPromotion.value
              : current.quantityPromotion,

      minimumAmount:
          minimumAmount.isSet
              ? minimumAmount.value
              : current.minimumAmount,

      minimumQuantity:
          minimumQuantity.isSet
              ? minimumQuantity.value
              : current.minimumQuantity,

      maximumDiscount:
          maximumDiscount.isSet
              ? maximumDiscount.value
              : current.maximumDiscount,

      usageLimit:
          usageLimit.isSet
              ? usageLimit.value
              : current.usageLimit,

      startDate:
          startDate.isSet
              ? startDate.value
              : current.startDate,

      endDate:
          endDate.isSet
              ? endDate.value
              : current.endDate,

      daysOfWeek:
          daysOfWeek.isSet
              ? List<int>.from(
                  daysOfWeek.value!,
                )
              : current.daysOfWeek,

      startTime:
          startTime.isSet
              ? startTime.value
              : current.startTime,

      endTime:
          endTime.isSet
              ? endTime.value
              : current.endTime,

      combinable:
          combinable.isSet
              ? combinable.value!
              : current.combinable,

      priority:
          priority.isSet
              ? priority.value!
              : current.priority,

      isActive:
          isActive.isSet
              ? isActive.value!
              : current.isActive,

      updatedAt:
          updatedAt,
    );
  }
}