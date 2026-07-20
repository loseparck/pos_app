import 'package:pos_app/features/catalog/domain/entities/discount.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';
import 'package:pos_app/features/payments/domain/entities/payment_transaction.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_session.g.dart';

enum PaymentMode { total, split, item }

const paymentModeEnumMap = {
  PaymentMode.total: 'total',
  PaymentMode.split: 'split',
  PaymentMode.item: 'item',
};

@JsonSerializable()
class PaymentSession {
  final String id;
  final Order order;
  final List<PaymentTransaction> history;
  final PaymentMode mode;
  final int? partCounts;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? createdById;

//final Discount? activeGlobalDiscount;
  const PaymentSession({
    required this.id,
    required this.order,
    this.history = const [],
    //this.activeGlobalDiscount,
    required this.mode,
    this.partCounts = 0,
    this.createdAt,
    this.updatedAt,
    this.createdById,
  });

  // Getters de référence basés sur l'Order injecté
  String get tableId => order.tableId ?? order.groupId ?? '';
  double get totalOrderRaw => order.total; // Supposons que ton entité Order expose le total brut
  double get totalAlreadyPaid => history.fold(0, (sum, tx) => sum + tx.amountDue);
  double get remainderToPay => (totalOrderRaw - totalAlreadyPaid).clamp(0, double.infinity);

  bool get hasStartedPaying => history.isNotEmpty;
  PaymentMode? get lockedPaymentMode => hasStartedPaying ? mode : null;

  // ==========================================
  // CALCUL MODE : TOTAL
  // ==========================================
  /*double get amountToPayForTotalMode {
    if (activeGlobalDiscount == null) return remainderToPay;
    double discountAmount = activeGlobalDiscount!.calculateDiscountAmount(remainderToPay);
    return (remainderToPay - discountAmount).clamp(0, double.infinity);
  }*/

  int itemPaidQte(String itemId) {
    return history.fold(0, (sum, tx) => sum + (tx.paidArticlesQty.containsKey(itemId) ? tx.paidArticlesQty[itemId]! : 0));
  }

  int paidPartCount() {
    return history.fold(0, (sum, tx) => sum + tx.paidPartCount);
  }

  // ==========================================
  // CALCUL MODE : SPLIT (Multi-parts simultanées)
  // ==========================================
  // On passe en paramètre ce que l'utilisateur manipule à l'écran (RAM/UI State)
  /*double amountToPayForSplitMode({
    required List<int> selectedPartNumbers,
    required Map<int, Discount> selectedPartsDiscounts,
  }) {
    int totalCouverts = order.numberOfGuests; // Supposons que numberOfGuests est dans ton Order
    
    // On calcule combien de parts n'ont pas encore été payées au total dans l'historique
    int partsAlreadyPaid = history.fold(0, (sum, tx) => sum + tx.paidPartNumbers.length);
    int partsRemaining = totalCouverts - partsAlreadyPaid;

    if (partsRemaining <= 0 || selectedPartNumbers.isEmpty) return 0.0;

    double rawPricePerPart = remainderToPay / partsRemaining;
    double totalAEncaisser = 0.0;

    for (int partNum in selectedPartNumbers) {
      // On cherche si une réduction est associée à cette part spécifique à l'écran
      final discount = selectedPartsDiscounts[partNum];
      double discountAmount = discount != null ? discount.calculateDiscountAmount(rawPricePerPart) : 0.0;
      
      totalAEncaisser += (rawPricePerPart - discountAmount).clamp(0, double.infinity);
    }
    return totalAEncaisser;
  }*/

  // ==========================================
  // CALCUL MODE : ARTICLES (Multi-articles simultanés)
  // ==========================================
  // On passe en paramètre la sélection actuelle de l'écran d'encaissement
  double amountToPayForArticlesMode({
    required Map<String, int> selectedQuantities, // {"id_article": quantite_a_payer_maintenant}
    required Map<String, Discount> selectedItemsDiscounts, // {"id_article": Discount}
  }) {
    double totalAEncaisser = 0.0;
    
    // On parcourt les articles contenus directement dans l'Order
    for (var item in order.items) { 
      int selectedQty = selectedQuantities[item.id] ?? 0;
      
      if (selectedQty > 0) {
        double rawSelectionPrice = item.total * selectedQty;
        final discount = selectedItemsDiscounts[item.id];
        
        double discountAmount = 0.0;
        if (discount != null) {
          // Gestion du prorata si la remise est un montant fixe (ex: -5€ sur le plat, mais on n'en paie qu'une partie)
          if (discount.discountType == DiscountType.fixed) {
            double prorata = selectedQty / item.quantity;
            discountAmount = discount.calculateDiscountAmount(item.total * item.quantity) * prorata;
          } else {
            discountAmount = discount.calculateDiscountAmount(rawSelectionPrice);
          }
        }
        
        totalAEncaisser += (rawSelectionPrice - discountAmount).clamp(0, double.infinity);
      }
    }
    return totalAEncaisser;
  }

  PaymentSession copyWith({
    List<PaymentTransaction>? history,
    Discount? activeGlobalDiscount,
    int? partCounts,
    String? id,
  }) {
    return PaymentSession(
      id: id ?? this.id,
      order: order,
      mode: mode,
      partCounts: partCounts ?? this.partCounts,
      history: history ?? this.history,
      //activeGlobalDiscount: activeGlobalDiscount ?? this.activeGlobalDiscount,
    );
  }
  
  @override
  String toString() {
    return toJson().toString();
  }

  factory PaymentSession.fromJson(Map<String, dynamic> json)
      => _$PaymentSessionFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentSessionToJson(this);
}