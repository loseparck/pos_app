import 'package:pos_app/features/discount/domain/entities/discount.dart';

class CreateDiscountDto {
  final String id;

  final String name;
  final String? description;

  final DiscountType type;
  final DiscountActivation activation;

  final String? code;

  final DiscountScope scope;

  final Set<String> productIds;
  final Set<String> categoryIds;

  final int? value;

  final QuantityPromotion? quantityPromotion;

  final int? minimumAmount;
  final int? minimumQuantity;
  final int? maximumDiscount;
  final int? usageLimit;

  final DateTime? startDate;
  final DateTime? endDate;

  final List<int> daysOfWeek;

  final String? startTime;
  final String? endTime;

  final bool combinable;
  final int priority;

  final bool isActive;

  final DateTime createdAt;

  const CreateDiscountDto({
    required this.id,
    required this.name,

    this.description,

    this.type =
        DiscountType.percentage,

    this.activation =
        DiscountActivation.manual,

    this.code,

    this.scope =
        DiscountScope.order,

    this.productIds = const {},
    this.categoryIds = const {},

    this.value,

    this.quantityPromotion,

    this.minimumAmount,
    this.minimumQuantity,
    this.maximumDiscount,

    this.usageLimit,

    this.startDate,
    this.endDate,

    this.daysOfWeek = const [],

    this.startTime,
    this.endTime,

    this.combinable = false,
    this.priority = 0,

    this.isActive = true,

    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,

      'name': name,
      'description': description,

      'type': type.label,
      'activation': activation.label,

      'code': code,

      'scope': scope.label,

      'productIds': productIds,
      'categoryIds': categoryIds,

      'value': value,

      'quantityPromotion':
          quantityPromotion?.toJson(),

      'minimumAmount':
          minimumAmount,

      'minimumQuantity':
          minimumQuantity,

      'maximumDiscount':
          maximumDiscount,

      'usageLimit':
          usageLimit,

      'startDate':
          startDate?.toIso8601String(),

      'endDate':
          endDate?.toIso8601String(),

      'daysOfWeek':
          daysOfWeek,

      'startTime':
          startTime,

      'endTime':
          endTime,

      'combinable':
          combinable,

      'priority':
          priority,

      'isActive':
          isActive,

      'createdAt':
          createdAt.toIso8601String(),
    };
  }
}

/*class CreateDiscountDto {
  final String name;
  final String? description;

  final DiscountType type;
  final DiscountActivation activation;

  final String? code;

  final DiscountScope scope;

  final List<String> productIds;
  final List<String> categoryIds;

  final double? value;

  final QuantityPromotion? quantityPromotion;

  final double? minimumAmount;
  final int? minimumQuantity;

  final double? maximumDiscount;

  final int? usageLimit;

  final DateTime? startDate;
  final DateTime? endDate;

  final List<int> daysOfWeek;

  final String? startTime;
  final String? endTime;

  final bool combinable;

  final int priority;

  final bool isActive;
  final DateTime createdAt;

  const CreateDiscountDto({
    required this.name,
    this.description,
    this.type = DiscountType.percentage,
    this.activation = DiscountActivation.manual,
    this.code,
    this.scope = DiscountScope.order,
    this.productIds = const [],
    this.categoryIds = const [],
    this.value,
    this.quantityPromotion,
    this.minimumAmount,
    this.minimumQuantity,
    this.maximumDiscount,
    this.usageLimit,
    this.startDate,
    this.endDate,
    this.daysOfWeek = const [],
    this.startTime,
    this.endTime,
    this.combinable = false,
    this.priority = 0,
    this.isActive = true,
    required  this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'type': type.name,
      'activation': activation.name,
      'code': code,
      'scope': scope.name,
      'productIds': productIds,
      'categoryIds': categoryIds,
      'value': value,
      'quantityPromotion':
          quantityPromotion?.toJson(),
      'minimumAmount': minimumAmount,
      'minimumQuantity': minimumQuantity,
      'maximumDiscount': maximumDiscount,
      'usageLimit': usageLimit,
      'startDate':
          startDate?.toIso8601String(),
      'endDate':
          endDate?.toIso8601String(),
      'daysOfWeek': daysOfWeek,
      'startTime': startTime,
      'endTime': endTime,
      'combinable': combinable,
      'priority': priority,
      'isActive': isActive,
    };
  }
}*/