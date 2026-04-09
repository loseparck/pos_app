import 'package:flutter_riverpod/legacy.dart';
import 'payment_notifier.dart';
import 'payment_state.dart';

/*final paymentProvider =
    StateNotifierProvider.family<PaymentNotifier, PaymentState>(
  (ref) => PaymentNotifier(),
);*/

final paymentProvider =
    StateNotifierProvider<PaymentNotifier, PaymentState>(
        (ref) => PaymentNotifier());