import 'package:pos_app/features/customer/domain/entities/customer.dart';

class CreateCustomerDto {
  final CustomerType type;

  final String? firstName;
  final String lastName;
  final String? companyName;
  final String? code;

  final String? siret;
  final String? siren;
  final String? vatNumber;

  final String? email;
  final String? phone;
  final String? secondaryPhone;

  final String? address;
  final String? addressComplement;
  final String? postalCode;
  final String? city;
  final String country;

  final String priceList;
  final double? permanentDiscount;
  final bool allowCredit;
  final int? creditLimit;

  final String? notes;
  final bool isActive;

  final DateTime createdAt;

  const CreateCustomerDto({
    required this.type,
    this.firstName,
    required this.lastName,
    this.companyName,
    this.code,
    this.siret,
    this.siren,
    this.vatNumber,
    this.email,
    this.phone,
    this.secondaryPhone,
    this.address,
    this.addressComplement,
    this.postalCode,
    this.city,
    required this.country,
    required this.priceList,
    this.permanentDiscount,
    required this.allowCredit,
    this.creditLimit,
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
    'type': type.name,
    'firstName': firstName,
    'lastName': lastName,
    'companyName': companyName,
    'code': code,
    'siret': siret,
    'siren': siren,
    'vatNumber': vatNumber,
    'email': email,
    'phone': phone,
    'secondaryPhone': secondaryPhone,
    'address': address,
    'addressComplement': addressComplement,
    'postalCode': postalCode,
    'city': city,
    'country': country,
    'priceList': priceList,
    'permanentDiscount': permanentDiscount,
    'allowCredit': allowCredit,
    'creditLimit': creditLimit,
    'notes': notes,
    'isActive': isActive,
    'createdAt': createdAt.toIso8601String(),
  };
}

factory CreateCustomerDto.fromJson(Map<String, dynamic> json) {
  return CreateCustomerDto(
    type: CustomerType.values.byName(json['type'] as String),
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String,
    companyName: json['companyName'] as String?,
    code: json['code'] as String?,
    siret: json['siret'] as String?,
    siren: json['siren'] as String?,
    vatNumber: json['vatNumber'] as String?,
    email: json['email'] as String?,
    phone: json['phone'] as String?,
    secondaryPhone: json['secondaryPhone'] as String?,
    address: json['address'] as String?,
    addressComplement: json['addressComplement'] as String?,
    postalCode: json['postalCode'] as String?,
    city: json['city'] as String?,
    country: json['country'] as String,
    priceList: json['priceList'] as String,
    permanentDiscount:
        (json['permanentDiscount'] as num?)?.toDouble(),
    allowCredit: json['allowCredit'] as bool,
    creditLimit: (json['creditLimit'] as num?)?.toInt(),
    notes: json['notes'] as String?,
    isActive: json['isActive'] as bool,
    createdAt: DateTime.parse(
      json['createdAt'] as String,
    ),
  );
}
}