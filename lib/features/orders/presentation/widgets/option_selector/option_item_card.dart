import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pos_app/features/catalog/domain/entities/item.dart';
import 'package:pos_app/features/catalog/domain/entities/option.dart';
import 'package:pos_app/features/orders/data/repositories/order_repository_provider.dart';

class OptionItemCard extends ConsumerWidget {

  final Option option;
  final Item item;

  const OptionItemCard({
    super.key,
    required this.option,
    required this.item,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantity = ref.watch(
      optionSelectionProvider.select(
        (state) =>
            state.quantityOf(option.id,item.id),
      ),
    );

    final selected = quantity > 0;

    return AspectRatio(
      aspectRatio: 1.15,
      child: InkWell(
        borderRadius:
            BorderRadius.circular(16),
        onTap: () {
          final notifier =
              ref.read(
                optionSelectionProvider
                    .notifier,
              );
          if (option.allowDuplicateSelection) {
            notifier.increaseQuantity(option.id,item.id, maxToSelect: option.maxToSelect);
          } else {
            notifier.toggleItem(
              option.id,
              item.id,
            );
          }
        },


        child: AnimatedContainer(
          duration:
              const Duration(
                milliseconds: 200,
              ),
          padding:
              const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: selected
                ? Theme.of(context)
                    .colorScheme
                    .primaryContainer
                : Theme.of(context)
                    .colorScheme
                    .surface,
            borderRadius:
                BorderRadius.circular(16),
            border: Border.all(
              color: selected
                  ? Theme.of(context)
                      .colorScheme
                      .primary
                  : Theme.of(context)
                      .colorScheme
                      .outlineVariant,
              width:
                  selected ? 2 : 1,
            ),
          ),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    item.name,
                    maxLines: 2,
                    overflow:
                        TextOverflow.ellipsis,
                    textAlign:
                        TextAlign.center,
                    style:
                        Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                              fontWeight:
                                  FontWeight.w600,
                            ),
                  ),
                ),
              ),
              Text(
                  item.price == 0
                      ? "Gratuit"
                      : "+${item.price.toStringAsFixed(2)} €",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              const SizedBox(
                height: 6,
              ),
              if(selected &&
                  option.allowDuplicateSelection)
                _QuantityStepper(
                  quantity: quantity,
                  onIncrease: () {
                    ref
                        .read(optionSelectionProvider.notifier).increaseQuantity(option.id, item.id, maxToSelect: option.maxToSelect);
                  },
                  onDecrease: () {
                    ref
                        .read(
                          optionSelectionProvider
                              .notifier,
                        )
                        .decreaseQuantity(
                          option.id,
                          item.id,
                        );
                  },
                ),
              if(selected &&
                  !option.allowDuplicateSelection)
                const Icon(
                  Icons.check_circle,
                  size: 22,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuantityStepper extends StatelessWidget {

  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const _QuantityStepper({
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior:
          HitTestBehavior.opaque,
      onTap:
          () {},
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 32,
            height: 32,
            child: IconButton(
              padding:
                  EdgeInsets.zero,
              icon:
                  const Icon(
                    Icons.remove_circle_outline,
                  ),
              iconSize: 20,
              onPressed:
                  onDecrease,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
            child: Text(
              quantity.toString(),
              style:
                  const TextStyle(
                    fontWeight:
                        FontWeight.bold,
                  ),
            ),
          ),
          SizedBox(
            width: 32,
            height: 32,
            child: IconButton(
              padding:
                  EdgeInsets.zero,
              icon:
                  const Icon(
                    Icons.add_circle_outline,
                  ),
              iconSize: 20,
              onPressed:
                  onIncrease,
            ),
          ),
        ],
      ),
    );
  }
}