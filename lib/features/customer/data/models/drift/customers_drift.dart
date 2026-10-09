import 'package:drift/drift.dart';
import 'package:pos_app/features/customer/domain/entities/customer.dart';

class CustomersDrift extends Table {
  TextColumn get id => text()();

  // Identité
  TextColumn get type =>
      textEnum<CustomerType>()();

  TextColumn get firstName =>
      text().nullable()();

  TextColumn get lastName =>
      text()();

  TextColumn get companyName =>
      text().nullable()();

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
  TextColumn get priceList =>
      text()();

  /// Pourcentage.
  RealColumn get permanentDiscount =>
      real().nullable()();

  BoolColumn get allowCredit =>
      boolean().withDefault(const Constant(false))();

  /// Stocké en centimes.
  IntColumn get creditLimitCents =>
      integer().nullable()();

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