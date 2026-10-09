
enum SupplierType {
  professional,
  individual,
}

enum PaymentTerm {
  cash,
  days15,
  days30,
  days45,
  days60,
}

class Supplier  {
  final String id;

  // Informations générales
  final String name;
  final String? commercialName;
  final SupplierType type;
  final String? code;

  // Informations légales
  final String? siret;
  final String? siren;
  final String? vatNumber;

  // Contact
  final String? contactFirstName;
  final String? contactLastName;
  final String? contactJob;
  final String? email;
  final String? phone;
  final String? secondaryPhone;

  // Adresse
  final String? address;
  final String? addressComplement;
  final String? postalCode;
  final String? city;
  final String country;

  // Commercial
  final PaymentTerm paymentTerm;
  final double? usualDiscount;
  final int? minimumOrderAmount;
  final int? deliveryDelayDays;
  final bool isMainSupplier;

  // Notes / statut
  final String? notes;
  final bool isActive;

  // Audit
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  const Supplier({
    required this.id,
    required this.name,
    this.commercialName,
    this.type = SupplierType.professional,
    this.code,
    this.siret,
    this.siren,
    this.vatNumber,
    this.contactFirstName,
    this.contactLastName,
    this.contactJob,
    this.email,
    this.phone,
    this.secondaryPhone,
    this.address,
    this.addressComplement,
    this.postalCode,
    this.city,
    required this.country,
    this.paymentTerm = PaymentTerm.cash,
    this.usualDiscount,
    this.minimumOrderAmount,
    this.deliveryDelayDays,
    this.isMainSupplier = true,
    this.notes,
    this.isActive = true,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  Supplier copyWith({
    String? id,
    String? name,
    String? commercialName,
    SupplierType? type,
    String? code,
    String? siret,
    String? siren,
    String? vatNumber,
    String? contactFirstName,
    String? contactLastName,
    String? contactJob,
    String? email,
    String? phone,
    String? secondaryPhone,
    String? address,
    String? addressComplement,
    String? postalCode,
    String? city,
    String? country,
    PaymentTerm? paymentTerm,
    double? usualDiscount,
    int? minimumOrderAmount,
    int? deliveryDelayDays,
    bool? isMainSupplier,
    String? notes,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) {
    return Supplier(
      id: id ?? this.id,
      name: name ?? this.name,
      commercialName: commercialName ?? this.commercialName,
      type: type ?? this.type,
      code: code ?? this.code,
      siret: siret ?? this.siret,
      siren: siren ?? this.siren,
      vatNumber: vatNumber ?? this.vatNumber,
      contactFirstName: contactFirstName ?? this.contactFirstName,
      contactLastName: contactLastName ?? this.contactLastName,
      contactJob: contactJob ?? this.contactJob,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      secondaryPhone: secondaryPhone ?? this.secondaryPhone,
      address: address ?? this.address,
      addressComplement: addressComplement ?? this.addressComplement,
      postalCode: postalCode ?? this.postalCode,
      city: city ?? this.city,
      country: country ?? this.country,
      paymentTerm: paymentTerm ?? this.paymentTerm,
      usualDiscount: usualDiscount ?? this.usualDiscount,
      minimumOrderAmount:
          minimumOrderAmount ?? this.minimumOrderAmount,
      deliveryDelayDays:
          deliveryDelayDays ?? this.deliveryDelayDays,
      isMainSupplier:
          isMainSupplier ?? this.isMainSupplier,
      notes: notes ?? this.notes,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }
/*
  @override
  List<Object?> get props => [
        id,
        name,
        commercialName,
        type,
        code,
        siret,
        siren,
        vatNumber,
        contactFirstName,
        contactLastName,
        contactJob,
        email,
        phone,
        secondaryPhone,
        address,
        addressComplement,
        postalCode,
        city,
        country,
        paymentTerm,
        usualDiscount,
        minimumOrderAmount,
        deliveryDelayDays,
        isMainSupplier,
        notes,
        isActive,
        createdAt,
        updatedAt,
        deletedAt,
      ];*/

  @override
  String toString() {
    return toJson().toString();
  }

  Map<String, dynamic> toJson() {
  return {
    'id': id,
    'name': name,
    'commercialName': commercialName,
    'type': type.name,
    'code': code,
    'siret': siret,
    'siren': siren,
    'vatNumber': vatNumber,
    'contactFirstName': contactFirstName,
    'contactLastName': contactLastName,
    'contactJob': contactJob,
    'email': email,
    'phone': phone,
    'secondaryPhone': secondaryPhone,
    'address': address,
    'addressComplement': addressComplement,
    'postalCode': postalCode,
    'city': city,
    'country': country,
    'paymentTerm': paymentTerm.name,
    'usualDiscount': usualDiscount,
    'minimumOrderAmount': minimumOrderAmount,
    'deliveryDelayDays': deliveryDelayDays,
    'isMainSupplier': isMainSupplier,
    'notes': notes,
    'isActive': isActive,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    'deletedAt': deletedAt?.toIso8601String(),
  };
}

factory Supplier.fromJson(Map<String, dynamic> json) {
  return Supplier(
    id: json['id'] as String,
    name: json['name'] as String,
    commercialName: json['commercialName'] as String?,
    type: SupplierType.values.byName(json['type'] as String),
    code: json['code'] as String?,
    siret: json['siret'] as String?,
    siren: json['siren'] as String?,
    vatNumber: json['vatNumber'] as String?,
    contactFirstName: json['contactFirstName'] as String?,
    contactLastName: json['contactLastName'] as String?,
    contactJob: json['contactJob'] as String?,
    email: json['email'] as String?,
    phone: json['phone'] as String?,
    secondaryPhone: json['secondaryPhone'] as String?,
    address: json['address'] as String?,
    addressComplement: json['addressComplement'] as String?,
    postalCode: json['postalCode'] as String?,
    city: json['city'] as String?,
    country: json['country'] as String,
    paymentTerm:
        PaymentTerm.values.byName(json['paymentTerm'] as String),
    usualDiscount: (json['usualDiscount'] as num?)?.toDouble(),
    minimumOrderAmount:
        (json['minimumOrderAmount'] as num?)?.toInt(),
    deliveryDelayDays: json['deliveryDelayDays'] as int?,
    isMainSupplier: json['isMainSupplier'] as bool,
    notes: json['notes'] as String?,
    isActive: json['isActive'] as bool,
    createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'] as String) : null,
    updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : null,
    deletedAt: json['deletedAt'] != null ? DateTime.parse(json['deletedAt'] as String) : null,
  );
}
}