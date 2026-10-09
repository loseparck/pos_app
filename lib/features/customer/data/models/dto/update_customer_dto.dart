import 'package:pos_app/features/customer/domain/entities/customer.dart';
import 'package:pos_app/features/discount/data/models/dto/optional.dart';

class UpdateCustomerDto {
  final Optional<CustomerType> type;

  final Optional<String?> firstName;
  final Optional<String> lastName;
  final Optional<String?> companyName;
  final Optional<String?> code;

  final Optional<String?> siret;
  final Optional<String?> siren;
  final Optional<String?> vatNumber;

  final Optional<String?> email;
  final Optional<String?> phone;
  final Optional<String?> secondaryPhone;

  final Optional<String?> address;
  final Optional<String?> addressComplement;
  final Optional<String?> postalCode;
  final Optional<String?> city;
  final Optional<String> country;

  final Optional<String> priceList;
  final Optional<double?> permanentDiscount;
  final Optional<bool> allowCredit;
  final Optional<int?> creditLimit;

  final Optional<String?> notes;
  final Optional<bool> isActive;

  final DateTime updatedAt;

  const UpdateCustomerDto({
    this.type = const Optional.unset(),

    this.firstName = const Optional.unset(),
    this.lastName = const Optional.unset(),
    this.companyName = const Optional.unset(),
    this.code = const Optional.unset(),

    this.siret = const Optional.unset(),
    this.siren = const Optional.unset(),
    this.vatNumber = const Optional.unset(),

    this.email = const Optional.unset(),
    this.phone = const Optional.unset(),
    this.secondaryPhone = const Optional.unset(),

    this.address = const Optional.unset(),
    this.addressComplement = const Optional.unset(),
    this.postalCode = const Optional.unset(),
    this.city = const Optional.unset(),
    this.country = const Optional.unset(),

    this.priceList = const Optional.unset(),
    this.permanentDiscount = const Optional.unset(),
    this.allowCredit = const Optional.unset(),
    this.creditLimit = const Optional.unset(),

    this.notes = const Optional.unset(),
    this.isActive = const Optional.unset(),

    required this.updatedAt,
  });

  @override
  String toString() {
    return toJson().toString();
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};

    if (type.isSet) {
      json['type'] = type.value?.name;
    }

    if (firstName.isSet) {
      json['firstName'] = firstName.value;
    }

    if (lastName.isSet) {
      json['lastName'] = lastName.value;
    }

    if (companyName.isSet) {
      json['companyName'] = companyName.value;
    }

    if (code.isSet) {
      json['code'] = code.value;
    }

    if (siret.isSet) {
      json['siret'] = siret.value;
    }

    if (siren.isSet) {
      json['siren'] = siren.value;
    }

    if (vatNumber.isSet) {
      json['vatNumber'] = vatNumber.value;
    }

    if (email.isSet) {
      json['email'] = email.value;
    }

    if (phone.isSet) {
      json['phone'] = phone.value;
    }

    if (secondaryPhone.isSet) {
      json['secondaryPhone'] = secondaryPhone.value;
    }

    if (address.isSet) {
      json['address'] = address.value;
    }

    if (addressComplement.isSet) {
      json['addressComplement'] = addressComplement.value;
    }

    if (postalCode.isSet) {
      json['postalCode'] = postalCode.value;
    }

    if (city.isSet) {
      json['city'] = city.value;
    }

    if (country.isSet) {
      json['country'] = country.value;
    }

    if (priceList.isSet) {
      json['priceList'] = priceList.value;
    }

    if (permanentDiscount.isSet) {
      json['permanentDiscount'] = permanentDiscount.value;
    }

    if (allowCredit.isSet) {
      json['allowCredit'] = allowCredit.value;
    }

    if (creditLimit.isSet) {
      json['creditLimit'] = creditLimit.value;
    }

    if (notes.isSet) {
      json['notes'] = notes.value;
    }

    if (isActive.isSet) {
      json['isActive'] = isActive.value;
    }

    json['updatedAt'] = updatedAt.toIso8601String();

    return json;
  }

  factory UpdateCustomerDto.fromJson(Map<String, dynamic> json) {
    return UpdateCustomerDto(
      type: json.containsKey('type')
          ? Optional.value(
              CustomerType.values.byName(
                json['type'] as String,
              ),
            )
          : const Optional.unset(),

      firstName: json.containsKey('firstName')
          ? Optional.value(json['firstName'] as String?)
          : const Optional.unset(),

      lastName: json.containsKey('lastName')
          ? Optional.value(json['lastName'] as String)
          : const Optional.unset(),

      companyName: json.containsKey('companyName')
          ? Optional.value(json['companyName'] as String?)
          : const Optional.unset(),

      code: json.containsKey('code')
          ? Optional.value(json['code'] as String?)
          : const Optional.unset(),

      siret: json.containsKey('siret')
          ? Optional.value(json['siret'] as String?)
          : const Optional.unset(),

      siren: json.containsKey('siren')
          ? Optional.value(json['siren'] as String?)
          : const Optional.unset(),

      vatNumber: json.containsKey('vatNumber')
          ? Optional.value(json['vatNumber'] as String?)
          : const Optional.unset(),

      email: json.containsKey('email')
          ? Optional.value(json['email'] as String?)
          : const Optional.unset(),

      phone: json.containsKey('phone')
          ? Optional.value(json['phone'] as String?)
          : const Optional.unset(),

      secondaryPhone: json.containsKey('secondaryPhone')
          ? Optional.value(json['secondaryPhone'] as String?)
          : const Optional.unset(),

      address: json.containsKey('address')
          ? Optional.value(json['address'] as String?)
          : const Optional.unset(),

      addressComplement:
          json.containsKey('addressComplement')
              ? Optional.value(
                  json['addressComplement'] as String?,
                )
              : const Optional.unset(),

      postalCode: json.containsKey('postalCode')
          ? Optional.value(json['postalCode'] as String?)
          : const Optional.unset(),

      city: json.containsKey('city')
          ? Optional.value(json['city'] as String?)
          : const Optional.unset(),

      country: json.containsKey('country')
          ? Optional.value(json['country'] as String)
          : const Optional.unset(),

      priceList: json.containsKey('priceList')
          ? Optional.value(json['priceList'] as String)
          : const Optional.unset(),

      permanentDiscount:
          json.containsKey('permanentDiscount')
              ? Optional.value(
                  (json['permanentDiscount'] as num?)?.toDouble(),
                )
              : const Optional.unset(),

      allowCredit: json.containsKey('allowCredit')
          ? Optional.value(json['allowCredit'] as bool)
          : const Optional.unset(),

      creditLimit: json.containsKey('creditLimit')
          ? Optional.value(
              (json['creditLimit'] as num?)?.toInt(),
            )
          : const Optional.unset(),

      notes: json.containsKey('notes')
          ? Optional.value(json['notes'] as String?)
          : const Optional.unset(),

      isActive: json.containsKey('isActive')
          ? Optional.value(json['isActive'] as bool)
          : const Optional.unset(),

      updatedAt: DateTime.parse(
        json['updatedAt'] as String,
      ),
    );
  }
}