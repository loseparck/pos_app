import 'package:drift/drift.dart';
import 'package:pos_app/features/payments/data/mappers/payment_converter.dart';

class PaymentTransactionDrift extends Table{

  TextColumn get id => text().unique()();

  TextColumn get sessionId => text()();
  TextColumn get discountId => text().nullable()();
  TextColumn get paymentMethod => text().withDefault(const Constant('draft'))();
  RealColumn get amountDue => real().withDefault(const Constant(0))();
  RealColumn get amountReceived => real().withDefault(const Constant(0))();
  IntColumn get paidPartCount => integer().withDefault(const Constant(0))();
  TextColumn get paidArticlesQty => text().map(const PaymentConverter())();
 

  DateTimeColumn get validatedAt => dateTime().nullable()();
  

  TextColumn get createdById => text().nullable()();

  DateTimeColumn get deletedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}