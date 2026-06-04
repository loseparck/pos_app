enum OrderStatus {
  draft,
  waitingValidation,
  validated,
  cancelled,
  delivred,
  paid,
}

const orderStatusEnumMap = {
  OrderStatus.draft: 'draft',
  OrderStatus.validated: 'validated',
  OrderStatus.waitingValidation: 'waitingValidation',
  OrderStatus.cancelled: 'cancelled',
  OrderStatus.delivred: 'delivred',
  OrderStatus.paid: 'paid',
};