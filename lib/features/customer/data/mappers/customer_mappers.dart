import 'package:drift/drift.dart';
import 'package:pos_app/data/local/db/app_database.dart';
import 'package:pos_app/features/customer/data/models/dto/create_customer_dto.dart';
import 'package:pos_app/features/customer/data/models/dto/update_customer_dto.dart';
import 'package:pos_app/features/customer/domain/entities/customer.dart';
import 'package:pos_app/features/discount/data/models/dto/optional.dart';

extension CustomerDriftMapper on Customer {
  CustomersDriftCompanion toCompanion() {
    return CustomersDriftCompanion(
      id: Value(id),

      type: Value(type),
      firstName: Value(firstName),
      lastName: Value(lastName),
      companyName: Value(companyName),
      code: Value(code),

      siret: Value(siret),
      siren: Value(siren),
      vatNumber: Value(vatNumber),

      email: Value(email),
      phone: Value(phone),
      secondaryPhone: Value(secondaryPhone),

      address: Value(address),
      addressComplement: Value(addressComplement),
      postalCode: Value(postalCode),
      city: Value(city),
      country: Value(country),

      priceList: Value(priceList),
      permanentDiscount: Value(permanentDiscount),
      allowCredit: Value(allowCredit),
      creditLimitCents:
          Value(creditLimit),

      notes: Value(notes),
      isActive: Value(isActive),

      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: Value(deletedAt),
    );
  }

  CreateCustomerDto toCreateDto() {
    return CreateCustomerDto(
      type: type,

      firstName: firstName,
      lastName: lastName,
      companyName: companyName,
      code: code,

      siret: siret,
      siren: siren,
      vatNumber: vatNumber,

      email: email,
      phone: phone,
      secondaryPhone: secondaryPhone,

      address: address,
      addressComplement: addressComplement,
      postalCode: postalCode,
      city: city,
      country: country,

      priceList: priceList,
      permanentDiscount: permanentDiscount,
      allowCredit: allowCredit,
      creditLimit: creditLimit,

      notes: notes,
      isActive: isActive,

      createdAt: createdAt,
    );
  }

  UpdateCustomerDto toUpdateDto() {
    return UpdateCustomerDto(
      type: Optional.value(type),

      firstName: Optional.value(firstName),
      lastName: Optional.value(lastName),
      companyName: Optional.value(companyName),
      code: Optional.value(code),

      siret: Optional.value(siret),
      siren: Optional.value(siren),
      vatNumber: Optional.value(vatNumber),

      email: Optional.value(email),
      phone: Optional.value(phone),
      secondaryPhone: Optional.value(secondaryPhone),

      address: Optional.value(address),
      addressComplement: Optional.value(addressComplement),
      postalCode: Optional.value(postalCode),
      city: Optional.value(city),
      country: Optional.value(country),

      priceList: Optional.value(priceList),
      permanentDiscount:
          Optional.value(permanentDiscount),
      allowCredit: Optional.value(allowCredit),
      creditLimit: Optional.value(creditLimit),

      notes: Optional.value(notes),
      isActive: Optional.value(isActive),

      updatedAt: updatedAt,
    );
  }
}

extension CustomerFromDriftMapper on CustomersDriftData {
  Customer toModel() {
    return Customer(
      id: id,

      type: type,
      firstName: firstName,
      lastName: lastName,
      companyName: companyName,
      code: code,

      siret: siret,
      siren: siren,
      vatNumber: vatNumber,

      email: email,
      phone: phone,
      secondaryPhone: secondaryPhone,

      address: address,
      addressComplement: addressComplement,
      postalCode: postalCode,
      city: city,
      country: country,

      priceList: priceList,
      permanentDiscount: permanentDiscount,
      allowCredit: allowCredit,

      creditLimit: creditLimitCents,

      notes: notes,
      isActive: isActive,

      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }
}