import 'package:drift/drift.dart';
import 'package:pos_app/features/supplier/domain/entities/supplier.dart';

class SuppliersDrift extends Table {
  TextColumn get id => text()();

  // Informations générales
  TextColumn get name => text()();

  TextColumn get commercialName =>
      text().nullable()();

  TextColumn get type =>
      textEnum<SupplierType>()();

  TextColumn get code =>
      text().nullable()();

  // Informations légales
  TextColumn get siret =>
      text().nullable()();

  TextColumn get siren =>
      text().nullable()();

  TextColumn get vatNumber =>
      text().nullable()();

  // Contact
  TextColumn get contactFirstName =>
      text().nullable()();

  TextColumn get contactLastName =>
      text().nullable()();

  TextColumn get contactJob =>
      text().nullable()();

  TextColumn get email =>
      text().nullable()();

  TextColumn get phone =>
      text().nullable()();

  TextColumn get secondaryPhone =>
      text().nullable()();

  // Adresse
  TextColumn get address =>
      text().nullable()();

  TextColumn get addressComplement =>
      text().nullable()();

  TextColumn get postalCode =>
      text().nullable()();

  TextColumn get city =>
      text().nullable()();

  TextColumn get country =>
      text()();

  // Commercial
  TextColumn get paymentTerm =>
      textEnum<PaymentTerm>()();

  /// Pourcentage.
  /// Exemple : 5.5% => 5.5
  RealColumn get usualDiscount =>
      real().nullable()();

  /// Stocké en centimes.
  /// Exemple : 125.50€ => 12550
  IntColumn get minimumOrderAmountCents =>
      integer().nullable()();

  IntColumn get deliveryDelayDays =>
      integer().nullable()();

  BoolColumn get isMainSupplier =>
      boolean().withDefault(const Constant(false))();

  // Notes / statut
  TextColumn get notes =>
      text().nullable()();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  // Audit
  DateTimeColumn get createdAt =>
      dateTime()();

  DateTimeColumn get updatedAt =>
      dateTime()();

  DateTimeColumn get deletedAt =>
      dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}