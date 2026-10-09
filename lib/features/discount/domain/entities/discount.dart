enum DiscountType {
  percentage(label: 'percentage'),
  fixedAmount(label: 'fixedAmount'),
  fixedPrice(label: 'fixedPrice'),
  quantityPromotion(label: 'quantityPromotion');

  const DiscountType({
    required this.label,
  });

  final String label;

  static DiscountType? fromLabel(String? label) {
    if (label == null) return null;

    for (final value in values) {
      if (value.label == label || value.name == label) {
        return value;
      }
    }

    return null;
  }
}

enum DiscountActivation {
  automatic(label: 'automatic'),
  promoCode(label: 'promoCode'),
  manual(label: 'manual');

  const DiscountActivation({
    required this.label,
  });

  final String label;

  static DiscountActivation? fromLabel(String? label) {
    if (label == null) return null;

    for (final value in values) {
      if (value.label == label || value.name == label) {
        return value;
      }
    }

    return null;
  }
}

enum DiscountScope {
  order(label: 'order'),
  products(label: 'products'),
  categories(label: 'categories');

  const DiscountScope({
    required this.label,
  });

  final String label;

  static DiscountScope? fromLabel(String? label) {
    if (label == null) return null;

    for (final value in values) {
      if (value.label == label || value.name == label) {
        return value;
      }
    }

    return null;
  }
}

enum QuantityRewardType {
  free(label: 'free'),
  percentage(label: 'percentage'),
  fixedPrice(label: 'fixedPrice'),
  bundlePrice(label: 'bundlePrice');

  const QuantityRewardType({
    required this.label,
  });

  final String label;

  static QuantityRewardType? fromLabel(String? label) {
    if (label == null) return null;

    for (final value in values) {
      if (value.label == label || value.name == label) {
        return value;
      }
    }

    return null;
  }
}


// ============================================================
// QUANTITY PROMOTION
// ============================================================

class QuantityPromotion {
  /// Nombre d'articles nécessaires pour déclencher
  /// la promotion.
  ///
  /// Exemple :
  /// 2 + 1 offert => 2
  final int triggerQuantity;

  /// Nombre d'articles bénéficiant de la récompense.
  ///
  /// Exemple :
  /// 2 + 1 offert => 1
  final int rewardQuantity;

  final QuantityRewardType rewardType;

  /// Dépend de rewardType :
  ///
  /// free :
  ///   null
  ///
  /// percentage :
  ///   50 = 50 %
  ///
  /// fixedPrice :
  ///   250 = 2,50 €
  ///
  /// bundlePrice :
  ///   généralement null
  final int? rewardValue;

  /// Prix total du pack en centimes.
  ///
  /// Exemple :
  /// 3 pizzas pour 25 € => 2500
  final int? bundlePrice;

  const QuantityPromotion({
    required this.triggerQuantity,
    required this.rewardQuantity,
    required this.rewardType,
    this.rewardValue,
    this.bundlePrice,
  });

  factory QuantityPromotion.fromJson(
    Map<String, dynamic> json,
  ) {
    return QuantityPromotion(
      triggerQuantity:
          (json['triggerQuantity'] as num?)?.toInt() ?? 0,

      rewardQuantity:
          (json['rewardQuantity'] as num?)?.toInt() ?? 0,

      rewardType:
          QuantityRewardType.fromLabel(
            json['rewardType'] as String?,
          ) ??
          QuantityRewardType.free,

      rewardValue:
          (json['rewardValue'] as num?)?.toInt(),

      bundlePrice:
          (json['bundlePrice'] as num?)?.toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'triggerQuantity': triggerQuantity,
      'rewardQuantity': rewardQuantity,
      'rewardType': rewardType.label,
      'rewardValue': rewardValue,
      'bundlePrice': bundlePrice,
    };
  }

  QuantityPromotion copyWith({
    int? triggerQuantity,
    int? rewardQuantity,
    QuantityRewardType? rewardType,
    int? rewardValue,
    int? bundlePrice,
  }) {
    return QuantityPromotion(
      triggerQuantity:
          triggerQuantity ?? this.triggerQuantity,

      rewardQuantity:
          rewardQuantity ?? this.rewardQuantity,

      rewardType:
          rewardType ?? this.rewardType,

      rewardValue:
          rewardValue ?? this.rewardValue,

      bundlePrice:
          bundlePrice ?? this.bundlePrice,
    );
  }
}


// ============================================================
// DISCOUNT
// ============================================================

class Discount {
  final String id;

  final String name;
  final String? description;

  final DiscountType type;

  final DiscountActivation activation;

  final String? code;

  final DiscountScope scope;

  final Set<String> productIds;

  final Set<String> categoryIds;

  /// Montant en centimes pour :
  ///
  /// fixedAmount :
  /// 1250 = 12,50 €
  ///
  /// percentage :
  /// 10 = 10 %
  final int? value;

  final QuantityPromotion? quantityPromotion;

  /// Montant en centimes.
  final int? minimumAmount;

  final int? minimumQuantity;

  /// Montant maximum de remise en centimes.
  final int? maximumDiscount;

  final int? usageLimit;

  /// Nombre d'utilisations.
  ///
  /// Champ géré par le système.
  final int usageCount;

  final DateTime? startDate;
  final DateTime? endDate;

  /// 1 = lundi
  /// 7 = dimanche
  final List<int> daysOfWeek;

  /// Format HH:mm.
  final String? startTime;
  final String? endTime;

  final bool combinable;

  final int priority;

  final bool isActive;

  // ============================================================
  // AUDIT
  // ============================================================

  final DateTime createdAt;
  final DateTime updatedAt;

  final DateTime? deletedAt;

  /// Première utilisation réelle de la réduction.
  final DateTime? firstUsedAt;

  /// Dernière utilisation réelle de la réduction.
  final DateTime? lastUsedAt;

  const Discount({
    required this.id,
    required this.name,

    this.description,

    this.type = DiscountType.percentage,

    this.activation = DiscountActivation.manual,

    this.code,

    this.scope = DiscountScope.order,

    this.productIds = const {},
    this.categoryIds = const {},

    this.value,

    this.quantityPromotion,

    this.minimumAmount,
    this.minimumQuantity,
    this.maximumDiscount,

    this.usageLimit,

    this.usageCount = 0,

    this.startDate,
    this.endDate,

    this.daysOfWeek = const [],

    this.startTime,
    this.endTime,

    this.combinable = false,

    this.priority = 0,

    this.isActive = true,

    required this.createdAt,
    required this.updatedAt,

    this.deletedAt,
    this.firstUsedAt,
    this.lastUsedAt,
  });

  factory Discount.fromJson(
    Map<String, dynamic> json,
  ) {
    return Discount(
      id: json['id'] as String,
      name: json['name'] as String,

      description:
          json['description'] as String?,

      type:
          DiscountType.fromLabel(
            json['type'] as String?,
          ) ??
          DiscountType.percentage,

      activation:
          DiscountActivation.fromLabel(
            json['activation'] as String?,
          ) ??
          DiscountActivation.manual,

      code:
          json['code'] as String?,

      scope:
          DiscountScope.fromLabel(
            json['scope'] as String?,
          ) ??
          DiscountScope.order,

      productIds:
          _parseStringSet(
            json['productIds'],
          ),

      categoryIds:
          _parseStringSet(
            json['categoryIds'],
          ),

      value:
          (json['value'] as num?)?.toInt(),

      quantityPromotion:
          json['quantityPromotion'] != null
              ? QuantityPromotion.fromJson(
                  Map<String, dynamic>.from(
                    json['quantityPromotion'],
                  ),
                )
              : null,

      minimumAmount:
          (json['minimumAmount'] as num?)?.toInt(),

      minimumQuantity:
          (json['minimumQuantity'] as num?)?.toInt(),

      maximumDiscount:
          (json['maximumDiscount'] as num?)?.toInt(),

      usageLimit:
          (json['usageLimit'] as num?)?.toInt(),

      usageCount:
          (json['usageCount'] as num?)?.toInt() ?? 0,

      startDate:
          _parseDateTime(json['startDate']),

      endDate:
          _parseDateTime(json['endDate']),

      daysOfWeek:
          _parseIntList(json['daysOfWeek']),

      startTime:
          json['startTime'] as String?,

      endTime:
          json['endTime'] as String?,

      combinable:
          json['combinable'] as bool? ?? false,

      priority:
          (json['priority'] as num?)?.toInt() ?? 0,

      isActive:
          json['isActive'] as bool? ?? true,

      createdAt:
          _parseDateTime(json['createdAt']) ??
          DateTime.now(),

      updatedAt:
          _parseDateTime(json['updatedAt']) ??
          DateTime.now(),

      deletedAt:
          _parseDateTime(json['deletedAt']),

      firstUsedAt:
          _parseDateTime(json['firstUsedAt']),

      lastUsedAt:
          _parseDateTime(json['lastUsedAt']),
    );
  }

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

      'minimumAmount': minimumAmount,
      'minimumQuantity': minimumQuantity,
      'maximumDiscount': maximumDiscount,

      'usageLimit': usageLimit,
      'usageCount': usageCount,

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

      'createdAt':
          createdAt.toIso8601String(),

      'updatedAt':
          updatedAt.toIso8601String(),

      'deletedAt':
          deletedAt?.toIso8601String(),

      'firstUsedAt':
          firstUsedAt?.toIso8601String(),

      'lastUsedAt':
          lastUsedAt?.toIso8601String(),
    };
  }

  @override
  String toString() => toJson().toString();

  Discount copyWith({
    String? id,
    String? name,
    String? description,

    DiscountType? type,
    DiscountActivation? activation,

    String? code,

    DiscountScope? scope,

    Set<String>? productIds,
    Set<String>? categoryIds,

    int? value,

    QuantityPromotion? quantityPromotion,

    int? minimumAmount,
    int? minimumQuantity,
    int? maximumDiscount,

    int? usageLimit,
    int? usageCount,

    DateTime? startDate,
    DateTime? endDate,

    List<int>? daysOfWeek,

    String? startTime,
    String? endTime,

    bool? combinable,
    int? priority,
    bool? isActive,

    DateTime? createdAt,
    DateTime? updatedAt,

    DateTime? deletedAt,
    DateTime? firstUsedAt,
    DateTime? lastUsedAt,
  }) {
    return Discount(
      id: id ?? this.id,
      name: name ?? this.name,

      description:
          description ?? this.description,

      type:
          type ?? this.type,

      activation:
          activation ?? this.activation,

      code:
          code ?? this.code,

      scope:
          scope ?? this.scope,

      productIds:
          productIds ?? this.productIds,

      categoryIds:
          categoryIds ?? this.categoryIds,

      value:
          value ?? this.value,

      quantityPromotion:
          quantityPromotion ??
          this.quantityPromotion,

      minimumAmount:
          minimumAmount ?? this.minimumAmount,

      minimumQuantity:
          minimumQuantity ?? this.minimumQuantity,

      maximumDiscount:
          maximumDiscount ??
          this.maximumDiscount,

      usageLimit:
          usageLimit ?? this.usageLimit,

      usageCount:
          usageCount ?? this.usageCount,

      startDate:
          startDate ?? this.startDate,

      endDate:
          endDate ?? this.endDate,

      daysOfWeek:
          daysOfWeek ?? this.daysOfWeek,

      startTime:
          startTime ?? this.startTime,

      endTime:
          endTime ?? this.endTime,

      combinable:
          combinable ?? this.combinable,

      priority:
          priority ?? this.priority,

      isActive:
          isActive ?? this.isActive,

      createdAt:
          createdAt ?? this.createdAt,

      updatedAt:
          updatedAt ?? this.updatedAt,

      deletedAt:
          deletedAt ?? this.deletedAt,

      firstUsedAt:
          firstUsedAt ?? this.firstUsedAt,

      lastUsedAt:
          lastUsedAt ?? this.lastUsedAt,
    );
  }

  /*static List<String> _parseStringList(
    dynamic value,
  ) {
    if (value is! List) {
      return const [];
    }

    return value
        .map((item) => item.toString())
        .toList();
  }*/

  static Set<String> _parseStringSet(
    dynamic value,
  ) {
    if (value is! List) {
      return const {};
    }

    return value
        .map((item) => item.toString())
        .toSet();
  }

  static List<int> _parseIntList(
    dynamic value,
  ) {
    if (value is! List) {
      return const [];
    }

    return value
        .whereType<num>()
        .map((item) => item.toInt())
        .toList();
  }

  static DateTime? _parseDateTime(
    dynamic value,
  ) {
    if (value == null) return null;

    if (value is DateTime) {
      return value;
    }

    if (value is String) {
      return DateTime.tryParse(value);
    }

    return null;
  }
}

/*enum DiscountType{ 
  percentage(label: "percentage"),
  fixedAmount(label: "occuped"),
  fixedPrice(label: "waitingForValidation"),
  quantityPromotion(label: "waitingForService");

  const DiscountType({
    required this.label
  });

  final String label;

  static DiscountType? fromLabel(String label) {
    for (final value in DiscountType.values) {
      if (value.label == label) {
        return value;
      }
    }
    return null;
  }
}

enum DiscountActivation{ 
  automatic(label: "automatic"),
  promoCode(label: "promoCode"),
  manual(label: "manual");

  const DiscountActivation({
    required this.label
  });

  final String label;

  static DiscountActivation? fromLabel(String label) {
    for (final value in DiscountActivation.values) {
      if (value.label == label) {
        return value;
      }
    }
    return null;
  }
}

enum DiscountScope{ 
  order(label: "order"),
  products(label: "products"),
  categories(label: "categories");

  const DiscountScope({
    required this.label
  });

  final String label;

  static DiscountScope? fromLabel(String label) {
    for (final value in DiscountScope.values) {
      if (value.label == label) {
        return value;
      }
    }
    return null;
  }
}

enum QuantityRewardType{ 
  free(label: "free"),
  percentage(label: "percentage"),
  fixedPrice(label: "fixedPrice"),
  bundlePrice(label: "bundlePrice");

  const QuantityRewardType({
    required this.label
  });

  final String label;

  static QuantityRewardType? fromLabel(String label) {
    for (final value in QuantityRewardType.values) {
      if (value.label == label) {
        return value;
      }
    }
    return null;
  }
}

class QuantityPromotion {
  /// Nombre d'articles nécessaires pour déclencher la promotion.
  ///
  /// Exemple :
  /// 2 + 1 offert => triggerQuantity = 2
  final int triggerQuantity;

  /// Nombre d'articles bénéficiant de l'avantage.
  ///
  /// Exemple :
  /// 2 + 1 offert => rewardQuantity = 1
  final int rewardQuantity;

  /// Type de l'avantage.
  final QuantityRewardType rewardType;

  /// Valeur de l'avantage.
  ///
  /// free:
  ///   ignorée
  ///
  /// percentage:
  ///   50 => -50 %
  ///
  /// fixedPrice:
  ///   2.50 => article à 2.50 €
  ///
  /// bundlePrice:
  ///   peut être null car bundlePrice est utilisé.
  final double? rewardValue;

  /// Prix total du pack.
  ///
  /// Exemple :
  /// 3 pizzas pour 25 €
  final double? bundlePrice;

  const QuantityPromotion({
    required this.triggerQuantity,
    required this.rewardQuantity,
    required this.rewardType,
    this.rewardValue,
    this.bundlePrice,
  });

  factory QuantityPromotion.fromJson(
    Map<String, dynamic> json,
  ) {
    return QuantityPromotion(
      triggerQuantity:
          (json['triggerQuantity'] as num?)?.toInt() ?? 0,
      rewardQuantity:
          (json['rewardQuantity'] as num?)?.toInt() ?? 0,
      rewardType: QuantityRewardType.values.firstWhere(
        (value) => value.name == json['rewardType'],
        orElse: () => QuantityRewardType.free,
      ),
      rewardValue:
          (json['rewardValue'] as num?)?.toDouble(),
      bundlePrice:
          (json['bundlePrice'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'triggerQuantity': triggerQuantity,
      'rewardQuantity': rewardQuantity,
      'rewardType': rewardType.name,
      'rewardValue': rewardValue,
      'bundlePrice': bundlePrice,
    };
  }

  QuantityPromotion copyWith({
    int? triggerQuantity,
    int? rewardQuantity,
    QuantityRewardType? rewardType,
    double? rewardValue,
    double? bundlePrice,
  }) {
    return QuantityPromotion(
      triggerQuantity:
          triggerQuantity ?? this.triggerQuantity,
      rewardQuantity:
          rewardQuantity ?? this.rewardQuantity,
      rewardType:
          rewardType ?? this.rewardType,
      rewardValue:
          rewardValue ?? this.rewardValue,
      bundlePrice:
          bundlePrice ?? this.bundlePrice,
    );
  }
}

class Discount {
  final String id;

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

  final int usageCount;

  final DateTime? startDate;
  final DateTime? endDate;

  final List<int> daysOfWeek;
  final String? startTime;
  final String? endTime;

  final bool combinable;
  final int priority;

  final bool isActive;

  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final DateTime? firstUsedAt;
  final DateTime? lastUsedAt;

  const Discount({
    required this.id,
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
    this.usageCount = 0,
    this.startDate,
    this.endDate,
    this.daysOfWeek = const [],
    this.startTime,
    this.endTime,
    this.combinable = false,
    this.priority = 0,
    this.isActive = true,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.firstUsedAt,
    this.lastUsedAt,
  });

  @override
  String toString() {
    return toJson().toString();
  }

  factory Discount.fromJson(
    Map<String, dynamic> json,
  ) {
    return Discount(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      type: DiscountType.values.firstWhere(
        (value) => value.name == json['type'],
        orElse: () => DiscountType.percentage,
      ),
      activation:
          DiscountActivation.values.firstWhere(
        (value) => value.name == json['activation'],
        orElse: () =>
            DiscountActivation.automatic,
      ),
      code: json['code'] as String?,
      scope: DiscountScope.values.firstWhere(
        (value) => value.name == json['scope'],
        orElse: () => DiscountScope.order,
      ),
      productIds: _parseStringList(
        json['productIds'],
      ),
      categoryIds: _parseStringList(
        json['categoryIds'],
      ),
      value: (json['value'] as num?)?.toDouble(),
      quantityPromotion:
          json['quantityPromotion'] != null
              ? QuantityPromotion.fromJson(
                  Map<String, dynamic>.from(
                    json['quantityPromotion'],
                  ),
                )
              : null,
      minimumAmount:
          (json['minimumAmount'] as num?)
              ?.toDouble(),
      minimumQuantity:
          (json['minimumQuantity'] as num?)?.toInt(),
      maximumDiscount:
          (json['maximumDiscount'] as num?)
              ?.toDouble(),
      usageLimit:
          (json['usageLimit'] as num?)?.toInt(),
      usageCount:
          (json['usageCount'] as num?)?.toInt() ?? 0,
      startDate: _parseDateTime(
        json['startDate'],
      ),
      endDate: _parseDateTime(
        json['endDate'],
      ),
      daysOfWeek: _parseIntList(
        json['daysOfWeek'],
      ),
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      combinable:
          json['combinable'] as bool? ?? false,
      priority:
          (json['priority'] as num?)?.toInt() ?? 0,
      isActive:
          json['isActive'] as bool? ?? true,
      createdAt:
          _parseDateTime(json['createdAt']) ??
              DateTime.now(),
      updatedAt:
          _parseDateTime(json['updatedAt']) ??
              DateTime.now(),
      deletedAt:
          _parseDateTime(json['deletedAt']) ??
              null,
      firstUsedAt:
          _parseDateTime(json['firstUsedAt']) ??
              null,
      lastUsedAt:
          _parseDateTime(json['lastUsedAt']) ??
              null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
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
      'usageCount': usageCount,
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'daysOfWeek': daysOfWeek,
      'startTime': startTime,
      'endTime': endTime,
      'combinable': combinable,
      'priority': priority,
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'firstUsedAt': firstUsedAt?.toIso8601String(),
      'lastUsedAt': lastUsedAt?.toIso8601String(),
    };
  }

  Discount copyWith({
    String? id,
    String? name,
    String? description,
    DiscountType? type,
    DiscountActivation? activation,
    String? code,
    DiscountScope? scope,
    List<String>? productIds,
    List<String>? categoryIds,
    double? value,
    QuantityPromotion? quantityPromotion,
    double? minimumAmount,
    int? minimumQuantity,
    double? maximumDiscount,
    int? usageLimit,
    int? usageCount,
    DateTime? startDate,
    DateTime? endDate,
    List<int>? daysOfWeek,
    String? startTime,
    String? endTime,
    bool? combinable,
    int? priority,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    DateTime? firstUsedAt,
    DateTime? lastUsedAt
  }) {
    return Discount(
      id: id ?? this.id,
      name: name ?? this.name,
      description:
          description ?? this.description,
      type: type ?? this.type,
      activation:
          activation ?? this.activation,
      code: code ?? this.code,
      scope: scope ?? this.scope,
      productIds:
          productIds ?? this.productIds,
      categoryIds:
          categoryIds ?? this.categoryIds,
      value: value ?? this.value,
      quantityPromotion:
          quantityPromotion ??
              this.quantityPromotion,
      minimumAmount:
          minimumAmount ?? this.minimumAmount,
      minimumQuantity:
          minimumQuantity ?? this.minimumQuantity,
      maximumDiscount:
          maximumDiscount ?? this.maximumDiscount,
      usageLimit:
          usageLimit ?? this.usageLimit,
      usageCount:
          usageCount ?? this.usageCount,
      startDate:
          startDate ?? this.startDate,
      endDate:
          endDate ?? this.endDate,
      daysOfWeek:
          daysOfWeek ?? this.daysOfWeek,
      startTime:
          startTime ?? this.startTime,
      endTime:
          endTime ?? this.endTime,
      combinable:
          combinable ?? this.combinable,
      priority:
          priority ?? this.priority,
      isActive:
          isActive ?? this.isActive,
      createdAt:
          createdAt ?? this.createdAt,
      updatedAt:
          updatedAt ?? this.updatedAt,
      deletedAt:
          deletedAt ?? this.deletedAt,
      firstUsedAt:
          firstUsedAt ?? this.firstUsedAt,
      lastUsedAt:
          lastUsedAt ?? this.lastUsedAt,
    );
  }

  // ─────────────────────────────────────────────
  // Helpers JSON
  // ─────────────────────────────────────────────

  static List<String> _parseStringList(
    dynamic value,
  ) {
    if (value == null) {
      return const [];
    }

    if (value is List) {
      return value
          .map((item) => item.toString())
          .toList();
    }

    return const [];
  }

  static List<int> _parseIntList(
    dynamic value,
  ) {
    if (value == null) {
      return const [];
    }

    if (value is List) {
      return value
          .whereType<num>()
          .map((item) => item.toInt())
          .toList();
    }

    return const [];
  }

  static DateTime? _parseDateTime(
    dynamic value,
  ) {
    if (value == null) {
      return null;
    }

    if (value is DateTime) {
      return value;
    }

    if (value is String) {
      return DateTime.tryParse(value);
    }

    return null;
  }
}*/