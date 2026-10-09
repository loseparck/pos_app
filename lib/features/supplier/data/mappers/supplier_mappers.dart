import 'package:drift/drift.dart';
import 'package:pos_app/data/local/db/app_database.dart';
import 'package:pos_app/features/discount/data/models/dto/optional.dart';
import 'package:pos_app/features/supplier/data/models/dto/create_supplier_dto.dart';
import 'package:pos_app/features/supplier/data/models/dto/update_supplier_dto.dart';
import 'package:pos_app/features/supplier/domain/entities/supplier.dart';

extension SupplierDriftMapper on Supplier {
  SuppliersDriftCompanion toCompanion() {
    return SuppliersDriftCompanion(
      id: Value(id),

      name: Value(name),
      commercialName: Value(commercialName),
      type: Value(type),
      code: Value(code),

      siret: Value(siret),
      siren: Value(siren),
      vatNumber: Value(vatNumber),

      contactFirstName: Value(contactFirstName),
      contactLastName: Value(contactLastName),
      contactJob: Value(contactJob),
      email: Value(email),
      phone: Value(phone),
      secondaryPhone: Value(secondaryPhone),

      address: Value(address),
      addressComplement: Value(addressComplement),
      postalCode: Value(postalCode),
      city: Value(city),
      country: Value(country),

      paymentTerm: Value(paymentTerm),
      usualDiscount: Value(usualDiscount),
      minimumOrderAmountCents:
          Value(minimumOrderAmount),
      deliveryDelayDays: Value(deliveryDelayDays),
      isMainSupplier: Value(isMainSupplier),

      notes: Value(notes),
      isActive: Value(isActive),

      createdAt: Value(createdAt ?? DateTime.now()),
      updatedAt: Value(updatedAt ?? DateTime.now()),
      deletedAt: Value(deletedAt),
    );
  }

  CreateSupplierDto toCreateDto() {
    return CreateSupplierDto(
      name: name,
      commercialName: commercialName,
      type: type,
      code: code,

      siret: siret,
      siren: siren,
      vatNumber: vatNumber,

      contactFirstName: contactFirstName,
      contactLastName: contactLastName,
      contactJob: contactJob,
      email: email,
      phone: phone,
      secondaryPhone: secondaryPhone,

      address: address,
      addressComplement: addressComplement,
      postalCode: postalCode,
      city: city,
      country: country,

      paymentTerm: paymentTerm,
      usualDiscount: usualDiscount,
      minimumOrderAmount: minimumOrderAmount,
      deliveryDelayDays: deliveryDelayDays,
      isMainSupplier: isMainSupplier,

      notes: notes,
      isActive: isActive,

      createdAt: createdAt ?? DateTime.now(),
    );
  }

  UpdateSupplierDto toUpdateDto() {
    return UpdateSupplierDto(
      name: Optional.value(name),
      commercialName: Optional.value(commercialName),
      type: Optional.value(type),
      code: Optional.value(code),

      siret: Optional.value(siret),
      siren: Optional.value(siren),
      vatNumber: Optional.value(vatNumber),

      contactFirstName: Optional.value(contactFirstName),
      contactLastName: Optional.value(contactLastName),
      contactJob: Optional.value(contactJob),
      email: Optional.value(email),
      phone: Optional.value(phone),
      secondaryPhone: Optional.value(secondaryPhone),

      address: Optional.value(address),
      addressComplement: Optional.value(addressComplement),
      postalCode: Optional.value(postalCode),
      city: Optional.value(city),
      country: Optional.value(country),

      paymentTerm: Optional.value(paymentTerm),
      usualDiscount: Optional.value(usualDiscount),
      minimumOrderAmount:
          Optional.value(minimumOrderAmount),
      deliveryDelayDays:
          Optional.value(deliveryDelayDays),
      isMainSupplier:
          Optional.value(isMainSupplier),

      notes: Optional.value(notes),
      isActive: Optional.value(isActive),

      updatedAt: updatedAt ?? DateTime.now(),
    );
  }
}

extension SupplierFromDriftMapper on SuppliersDriftData {
  Supplier toModel() {
    return Supplier(
      id: id,

      name: name,
      commercialName: commercialName,
      type: type,
      code: code,

      siret: siret,
      siren: siren,
      vatNumber: vatNumber,

      contactFirstName: contactFirstName,
      contactLastName: contactLastName,
      contactJob: contactJob,
      email: email,
      phone: phone,
      secondaryPhone: secondaryPhone,

      address: address,
      addressComplement: addressComplement,
      postalCode: postalCode,
      city: city,
      country: country,

      paymentTerm: paymentTerm,
      usualDiscount: usualDiscount,
      minimumOrderAmount:
          minimumOrderAmountCents,

      deliveryDelayDays: deliveryDelayDays,
      isMainSupplier: isMainSupplier,

      notes: notes,
      isActive: isActive,

      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }
}