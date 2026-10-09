import 'package:pos_app/features/supplier/domain/entities/supplier.dart';

class CreateSupplierDto {
  final String name;
  final String? commercialName;
  final SupplierType type;
  final String? code;

  final String? siret;
  final String? siren;
  final String? vatNumber;

  final String? contactFirstName;
  final String? contactLastName;
  final String? contactJob;
  final String? email;
  final String? phone;
  final String? secondaryPhone;

  final String? address;
  final String? addressComplement;
  final String? postalCode;
  final String? city;
  final String country;

  final PaymentTerm paymentTerm;
  final double? usualDiscount;
  final int? minimumOrderAmount;
  final int? deliveryDelayDays;
  final bool isMainSupplier;

  final String? notes;
  final bool isActive;

  /// Utile pour la création offline.
  final DateTime createdAt;

  const CreateSupplierDto({
    required this.name,
    this.commercialName,
    required this.type,
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
    required this.paymentTerm,
    this.usualDiscount,
    this.minimumOrderAmount,
    this.deliveryDelayDays,
    required this.isMainSupplier,
    this.notes,
    required this.isActive,
    required this.createdAt,
  });

  @override
  String toString() {
    return toJson().toString();
  }

  Map<String, dynamic> toJson() {
  return {
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
    'createdAt': createdAt.toIso8601String(),
  };
}

factory CreateSupplierDto.fromJson(Map<String, dynamic> json) {
  return CreateSupplierDto(
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
    createdAt: DateTime.parse(json['createdAt'] as String),
  );
}
}