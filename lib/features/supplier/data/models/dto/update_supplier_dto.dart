
import 'package:pos_app/features/discount/data/models/dto/optional.dart';
import 'package:pos_app/features/supplier/domain/entities/supplier.dart';

class UpdateSupplierDto {
  final Optional<String> name;
  final Optional<String?> commercialName;
  final Optional<SupplierType> type;
  final Optional<String?> code;

  final Optional<String?> siret;
  final Optional<String?> siren;
  final Optional<String?> vatNumber;

  final Optional<String?> contactFirstName;
  final Optional<String?> contactLastName;
  final Optional<String?> contactJob;
  final Optional<String?> email;
  final Optional<String?> phone;
  final Optional<String?> secondaryPhone;

  final Optional<String?> address;
  final Optional<String?> addressComplement;
  final Optional<String?> postalCode;
  final Optional<String?> city;
  final Optional<String> country;

  final Optional<PaymentTerm> paymentTerm;
  final Optional<double?> usualDiscount;
  final Optional<int?> minimumOrderAmount;
  final Optional<int?> deliveryDelayDays;
  final Optional<bool> isMainSupplier;

  final Optional<String?> notes;
  final Optional<bool> isActive;

  /// Obligatoire lors d'un update.
  final DateTime updatedAt;

  const UpdateSupplierDto({
    this.name = const Optional.unset(),
    this.commercialName = const Optional.unset(),
    this.type = const Optional.unset(),
    this.code = const Optional.unset(),
    this.siret = const Optional.unset(),
    this.siren = const Optional.unset(),
    this.vatNumber = const Optional.unset(),
    this.contactFirstName = const Optional.unset(),
    this.contactLastName = const Optional.unset(),
    this.contactJob = const Optional.unset(),
    this.email = const Optional.unset(),
    this.phone = const Optional.unset(),
    this.secondaryPhone = const Optional.unset(),
    this.address = const Optional.unset(),
    this.addressComplement = const Optional.unset(),
    this.postalCode = const Optional.unset(),
    this.city = const Optional.unset(),
    this.country = const Optional.unset(),
    this.paymentTerm = const Optional.unset(),
    this.usualDiscount = const Optional.unset(),
    this.minimumOrderAmount = const Optional.unset(),
    this.deliveryDelayDays = const Optional.unset(),
    this.isMainSupplier = const Optional.unset(),
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

  if (name.isSet) {
    json['name'] = name.value;
  }
  if (commercialName.isSet) {
    json['commercialName'] = commercialName.value;
  }
  if (type.isSet) {
    json['type'] = type.value?.name;
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
  if (contactFirstName.isSet) {
    json['contactFirstName'] = contactFirstName.value;
  }
  if (contactLastName.isSet) {
    json['contactLastName'] = contactLastName.value;
  }
  if (contactJob.isSet) {
    json['contactJob'] = contactJob.value;
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
  if (paymentTerm.isSet) {
    json['paymentTerm'] = paymentTerm.value?.name;
  }
  if (usualDiscount.isSet) {
    json['usualDiscount'] = usualDiscount.value;
  }
  if (minimumOrderAmount.isSet) {
    json['minimumOrderAmount'] = minimumOrderAmount.value;
  }
  if (deliveryDelayDays.isSet) {
    json['deliveryDelayDays'] = deliveryDelayDays.value;
  }
  if (isMainSupplier.isSet) {
    json['isMainSupplier'] = isMainSupplier.value;
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

factory UpdateSupplierDto.fromJson(Map<String, dynamic> json) {
  return UpdateSupplierDto(
    name: json.containsKey('name')
        ? Optional.value(json['name'] as String)
        : const Optional.unset(),

    commercialName: json.containsKey('commercialName')
        ? Optional.value(json['commercialName'] as String?)
        : const Optional.unset(),

    type: json.containsKey('type')
        ? Optional.value(
            SupplierType.values.byName(json['type'] as String),
          )
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

    contactFirstName: json.containsKey('contactFirstName')
        ? Optional.value(json['contactFirstName'] as String?)
        : const Optional.unset(),

    contactLastName: json.containsKey('contactLastName')
        ? Optional.value(json['contactLastName'] as String?)
        : const Optional.unset(),

    contactJob: json.containsKey('contactJob')
        ? Optional.value(json['contactJob'] as String?)
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

    paymentTerm: json.containsKey('paymentTerm')
        ? Optional.value(
            PaymentTerm.values.byName(
              json['paymentTerm'] as String,
            ),
          )
        : const Optional.unset(),

    usualDiscount: json.containsKey('usualDiscount')
        ? Optional.value(
            (json['usualDiscount'] as num?)?.toDouble(),
          )
        : const Optional.unset(),

    minimumOrderAmount:
        json.containsKey('minimumOrderAmount')
            ? Optional.value(
                (json['minimumOrderAmount'] as num?)?.toInt(),
              )
            : const Optional.unset(),

    deliveryDelayDays:
        json.containsKey('deliveryDelayDays')
            ? Optional.value(
                json['deliveryDelayDays'] as int?,
              )
            : const Optional.unset(),

    isMainSupplier:
        json.containsKey('isMainSupplier')
            ? Optional.value(
                json['isMainSupplier'] as bool,
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