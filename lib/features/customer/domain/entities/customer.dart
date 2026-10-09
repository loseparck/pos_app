enum CustomerType {
  individual,
  professional,
}

class Customer {
  final String id;

  // Identité
  final CustomerType type;
  final String? firstName;
  final String lastName;
  final String? companyName;
  final String? code;

  // Informations légales
  final String? siret;
  final String? siren;
  final String? vatNumber;

  // Contact
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
  final String priceList;
  final double? permanentDiscount;
  final bool allowCredit;
  final int? creditLimit;

  // Notes / statut
  final String? notes;
  final bool isActive;

  // Audit
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  const Customer({
    required this.id,
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
    required this.updatedAt,
    this.deletedAt,
  });

  Customer copyWith({
    String? id,
    CustomerType? type,
    String? firstName,
    String? lastName,
    String? companyName,
    String? code,
    String? siret,
    String? siren,
    String? vatNumber,
    String? email,
    String? phone,
    String? secondaryPhone,
    String? address,
    String? addressComplement,
    String? postalCode,
    String? city,
    String? country,
    String? priceList,
    double? permanentDiscount,
    bool? allowCredit,
    int? creditLimit,
    String? notes,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) {
    return Customer(
      id: id ?? this.id,
      type: type ?? this.type,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      companyName: companyName ?? this.companyName,
      code: code ?? this.code,
      siret: siret ?? this.siret,
      siren: siren ?? this.siren,
      vatNumber: vatNumber ?? this.vatNumber,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      secondaryPhone: secondaryPhone ?? this.secondaryPhone,
      address: address ?? this.address,
      addressComplement: addressComplement ?? this.addressComplement,
      postalCode: postalCode ?? this.postalCode,
      city: city ?? this.city,
      country: country ?? this.country,
      priceList: priceList ?? this.priceList,
      permanentDiscount:
          permanentDiscount ?? this.permanentDiscount,
      allowCredit: allowCredit ?? this.allowCredit,
      creditLimit: creditLimit ?? this.creditLimit,
      notes: notes ?? this.notes,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  String get name {
    if(type == CustomerType.professional){
      if(lastName != '' || firstName !=null){
        return '$companyName ($lastName ${firstName ?? ''})';
      } else {
        return '$companyName';
      }
    } else{
      return '$lastName $firstName';
    }
  }

  /*@override
  List<Object?> get props => [
        id,
        type,
        firstName,
        lastName,
        companyName,
        code,
        siret,
        siren,
        vatNumber,
        email,
        phone,
        secondaryPhone,
        address,
        addressComplement,
        postalCode,
        city,
        country,
        priceList,
        permanentDiscount,
        allowCredit,
        creditLimit,
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
    'updatedAt': updatedAt.toIso8601String(),
    'deletedAt': deletedAt?.toIso8601String(),
  };
}

factory Customer.fromJson(Map<String, dynamic> json) {
  return Customer(
    id: json['id'] as String,
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
    createdAt: DateTime.parse(json['createdAt'] as String),
    updatedAt: DateTime.parse(json['updatedAt'] as String),
    deletedAt: json['deletedAt'] != null
        ? DateTime.parse(json['deletedAt'] as String)
        : null,
  );
}
}