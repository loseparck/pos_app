import 'package:drift/drift.dart';
import 'package:pos_app/data/local/db/app_database.dart';
import 'package:pos_app/features/payments/data/datasources/payment_local_datasource.dart';
import 'package:pos_app/features/payments/data/mappers/order_mappers.dart';
import 'package:pos_app/features/payments/domain/entities/payment_session.dart';
import 'package:pos_app/features/payments/domain/entities/payment_transaction.dart';

class PaymentLocalDatasourceImpl implements PaymentLocalDatasource {
  PaymentLocalDatasourceImpl(this._db);

  final AppDatabase? _db;

  @override
  Future<PaymentTransaction?> ceatePaymentTransaction(PaymentTransaction transaction) async {
    if( _db == null){
      return null;
    }
    await _db?.transaction(() async {
      await _db?.into(_db!.paymentTransactionDrift).insert(
        transaction.toDrift(),
        onConflict: DoUpdate(
          (_) => transaction.toDrift(),
          target: [ _db!.paymentTransactionDrift.id],
        ),
      );
      return transaction;
    });
    return transaction;
  }

  @override
  Future<PaymentSession?> createPayment(PaymentSession paymentSession) async {
    if( _db == null){
      return null;
    }
    await _db?.transaction(() async {
       
      await _db?.into(_db!.paymentSessionDrift).insert(
        paymentSession.toDrift(),
        onConflict: DoUpdate(
          (_) => paymentSession.toDrift(),
          target: [ _db!.paymentSessionDrift.id],
        ),
      );
      return paymentSession;
    });
    return paymentSession;
  }

  @override
  Future<List<PaymentTransaction>> getSessionTransactions(String sessionId) async{
    if( _db == null){
      return [];
    }
    final transactions = await ( _db!.select( _db!.paymentTransactionDrift)
          ..where((tbl) => 
          tbl.sessionId.equals(sessionId)))
        .get();
    return Future.wait(transactions.map((e) async { return e.toEntity(); }).toList());
  }

  @override
  Future<PaymentSession?> getPaymentById(String id) async{
    if( _db == null){
      return null;
    }
    final session = await ( _db!.select( _db!.paymentSessionDrift)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();

    /*await _db?.transaction(() async {
      final sessionDb 
      if(sessionDb != null){
        session = sessionDb.toEntity(history: await getSessionTransactions(sessionDb.id));
      }
    });*/
    //return session;
    return session?.toEntity(history: await getSessionTransactions(session.id));
  }

  @override
  Future<PaymentSession?> getPaymentByOrder(String orderId) async {
    if( _db == null){
      return null;
    }

    final localSession = await ( _db!.select( _db!.paymentSessionDrift)
          ..where((tbl) =>tbl.orderId.equals(orderId)))
        .getSingleOrNull();

    if (localSession == null) {
      return null;
    }

    return localSession.toEntity(
      history: await getSessionTransactions(localSession.id),
    );
  }

  @override
  Future<PaymentTransaction?> getTransaction(String id) async {
    if( _db == null){
      return null;
    }
    //late final PaymentTransaction transaction;

    final transaction = await ( _db!.select( _db!.paymentTransactionDrift)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
    /*await _db?.transaction(() async {
      final transactionDb = await ( _db!.select( _db!.paymentTransactionDrift)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
      if(transactionDb != null){
        transaction = transactionDb.toEntity();
      }
    });*/
    return transaction?.toEntity();
  }
  
}