import 'package:drift/drift.dart';

class DiscountsDrift extends Table {

  TextColumn get id => text()();
  TextColumn get name => text().withLength( min: 1, max: 150)();
  TextColumn get description => text().nullable()();
  TextColumn get type => text()();
  TextColumn get activation => text()();
  TextColumn get code => text().nullable()();
  TextColumn get scope => text()();

  TextColumn get productIds =>  text().withDefault( const Constant(''))();
  TextColumn get categoryIds => text().withDefault(const Constant(''))();

  IntColumn get value => integer().nullable()();
  
  IntColumn get quantityTrigger => integer().nullable()();
  IntColumn get quantityReward => integer().nullable()();
  TextColumn get quantityRewardType => text().nullable()();
  IntColumn get quantityRewardValue =>integer().nullable()();
  IntColumn get quantityBundlePrice => integer().nullable()();

  IntColumn get minimumAmount => integer().nullable()();
  IntColumn get minimumQuantity => integer().nullable()();
  IntColumn get maximumDiscount => integer().nullable()();

  IntColumn get usageLimit => integer().nullable()();
  IntColumn get usageCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get firstUsedAt =>dateTime().nullable()();
  DateTimeColumn get lastUsedAt =>dateTime().nullable()();

  DateTimeColumn get startDate => dateTime().nullable()();
  DateTimeColumn get endDate => dateTime().nullable()();
  TextColumn get daysOfWeek => text().withDefault( const Constant('[]'))();
  TextColumn get startTime => text().nullable()();
  TextColumn get endTime => text().nullable()();

  BoolColumn get combinable => boolean().withDefault( const Constant(false))();
  IntColumn get priority => integer().withDefault( const Constant(0))();

  BoolColumn get isActive =>boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}