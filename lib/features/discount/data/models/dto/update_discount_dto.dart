
import 'package:pos_app/features/discount/domain/entities/discount.dart';

import 'optional.dart';

class UpdateDiscountDto {
  final Optional<String> name;

  final Optional<String?> description;

  final Optional<DiscountType> type;

  final Optional<DiscountActivation> activation;

  final Optional<String?> code;

  final Optional<DiscountScope> scope;

  final Optional<Set<String>> productIds;

  final Optional<Set<String>> categoryIds;

  final Optional<int?> value;

  final Optional<QuantityPromotion?>
      quantityPromotion;

  final Optional<int?> minimumAmount;

  final Optional<int?> minimumQuantity;

  final Optional<int?> maximumDiscount;

  final Optional<int?> usageLimit;

  final Optional<DateTime?> startDate;

  final Optional<DateTime?> endDate;

  final Optional<List<int>> daysOfWeek;

  final Optional<String?> startTime;

  final Optional<String?> endTime;

  final Optional<bool> combinable;

  final Optional<int> priority;

  final Optional<bool> isActive;

  final DateTime updatedAt;

  const UpdateDiscountDto({
    this.name =
        const Optional.unset(),

    this.description =
        const Optional.unset(),

    this.type =
        const Optional.unset(),

    this.activation =
        const Optional.unset(),

    this.code =
        const Optional.unset(),

    this.scope =
        const Optional.unset(),

    this.productIds =
        const Optional.unset(),

    this.categoryIds =
        const Optional.unset(),

    this.value =
        const Optional.unset(),

    this.quantityPromotion =
        const Optional.unset(),

    this.minimumAmount =
        const Optional.unset(),

    this.minimumQuantity =
        const Optional.unset(),

    this.maximumDiscount =
        const Optional.unset(),

    this.usageLimit =
        const Optional.unset(),

    this.startDate =
        const Optional.unset(),

    this.endDate =
        const Optional.unset(),

    this.daysOfWeek =
        const Optional.unset(),

    this.startTime =
        const Optional.unset(),

    this.endTime =
        const Optional.unset(),

    this.combinable =
        const Optional.unset(),

    this.priority =
        const Optional.unset(),

    this.isActive =
        const Optional.unset(),

    required this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    final json =
        <String, dynamic>{};

    if (name.isSet) {
      json['name'] = name.value;
    }

    if (description.isSet) {
      json['description'] =
          description.value;
    }

    if (type.isSet) {
      json['type'] =
          type.value?.label;
    }

    if (activation.isSet) {
      json['activation'] =
          activation.value?.label;
    }

    if (code.isSet) {
      json['code'] = code.value;
    }

    if (scope.isSet) {
      json['scope'] =
          scope.value?.label;
    }

    if (productIds.isSet) {
      json['productIds'] =
          productIds.value;
    }

    if (categoryIds.isSet) {
      json['categoryIds'] =
          categoryIds.value;
    }

    if (value.isSet) {
      json['value'] =
          value.value;
    }

    if (quantityPromotion.isSet) {
      json['quantityPromotion'] =
          quantityPromotion.value
              ?.toJson();
    }

    if (minimumAmount.isSet) {
      json['minimumAmount'] =
          minimumAmount.value;
    }

    if (minimumQuantity.isSet) {
      json['minimumQuantity'] =
          minimumQuantity.value;
    }

    if (maximumDiscount.isSet) {
      json['maximumDiscount'] =
          maximumDiscount.value;
    }

    if (usageLimit.isSet) {
      json['usageLimit'] =
          usageLimit.value;
    }

    if (startDate.isSet) {
      json['startDate'] =
          startDate.value
              ?.toIso8601String();
    }

    if (endDate.isSet) {
      json['endDate'] =
          endDate.value
              ?.toIso8601String();
    }

    if (daysOfWeek.isSet) {
      json['daysOfWeek'] =
          daysOfWeek.value;
    }

    if (startTime.isSet) {
      json['startTime'] =
          startTime.value;
    }

    if (endTime.isSet) {
      json['endTime'] =
          endTime.value;
    }

    if (combinable.isSet) {
      json['combinable'] =
          combinable.value;
    }

    if (priority.isSet) {
      json['priority'] =
          priority.value;
    }

    if (isActive.isSet) {
      json['isActive'] =
          isActive.value;
    }

    json['updatedAt'] =
        updatedAt.toIso8601String();

    return json;
  }
}

/*class UpdateDiscountDto {
  final String? name;
  final String? description;

  final DiscountType? type;
  final DiscountActivation? activation;

  final String? code;

  final DiscountScope? scope;

  final List<String>? productIds;
  final List<String>? categoryIds;

  final double? value;

  final QuantityPromotion? quantityPromotion;

  final double? minimumAmount;
  final int? minimumQuantity;

  final double? maximumDiscount;

  final int? usageLimit;

  final DateTime? startDate;
  final DateTime? endDate;

  final List<int>? daysOfWeek;

  final String? startTime;
  final String? endTime;

  final bool? combinable;

  final int? priority;
  final bool? isActive;
  final DateTime updatedAt;

  const UpdateDiscountDto({
    this.name,
    this.description,

    this.type,
    this.activation,
    this.code,
    this.scope,

    this.productIds,
    this.categoryIds,

    this.value,
    this.quantityPromotion,

    this.minimumAmount,
    this.minimumQuantity,
    this.maximumDiscount,

    this.usageLimit,

    this.startDate,
    this.endDate,

    this.daysOfWeek,

    this.startTime,
    this.endTime,

    this.combinable,
    this.priority,

    this.isActive,
    required this.updatedAt
  });

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};

    if (name != null) {
      json['name'] = name;
    }

    if (description != null) {
      json['description'] = description;
    }

    if (type != null) {
      json['type'] = type!.name;
    }

    if (activation != null) {
      json['activation'] = activation!.name;
    }

    if (code != null) {
      json['code'] = code;
    }

    if (scope != null) {
      json['scope'] = scope!.name;
    }

    if (productIds != null) {
      json['productIds'] = productIds;
    }

    if (categoryIds != null) {
      json['categoryIds'] = categoryIds;
    }

    if (value != null) {
      json['value'] = value;
    }

    if (quantityPromotion != null) {
      json['quantityPromotion'] =
          quantityPromotion!.toJson();
    }

    if (minimumAmount != null) {
      json['minimumAmount'] = minimumAmount;
    }

    if (minimumQuantity != null) {
      json['minimumQuantity'] =
          minimumQuantity;
    }

    if (maximumDiscount != null) {
      json['maximumDiscount'] =
          maximumDiscount;
    }

    if (usageLimit != null) {
      json['usageLimit'] = usageLimit;
    }

    if (startDate != null) {
      json['startDate'] =
          startDate!.toIso8601String();
    }

    if (endDate != null) {
      json['endDate'] =
          endDate!.toIso8601String();
    }

    if (daysOfWeek != null) {
      json['daysOfWeek'] = daysOfWeek;
    }

    if (startTime != null) {
      json['startTime'] = startTime;
    }

    if (endTime != null) {
      json['endTime'] = endTime;
    }

    if (combinable != null) {
      json['combinable'] = combinable;
    }

    if (priority != null) {
      json['priority'] = priority;
    }

    if (isActive != null) {
      json['isActive'] = isActive;
    }

    return json;
  }
}*/