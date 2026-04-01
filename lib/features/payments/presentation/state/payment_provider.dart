import 'package:flutter_riverpod/legacy.dart';
import 'payment_notifier.dart';
import 'payment_state.dart';

final paymentProvider =
    StateNotifierProvider.family<PaymentNotifier, PaymentState, double>(
  (ref, total) => PaymentNotifier(total),
);