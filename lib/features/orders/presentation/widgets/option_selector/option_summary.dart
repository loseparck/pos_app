import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pos_app/features/catalog/domain/entities/option.dart';
import 'package:pos_app/features/orders/data/repositories/order_repository_provider.dart';


class OptionSummary extends ConsumerWidget {

  final List<Option> options;


  const OptionSummary({

    super.key,

    required this.options,

  });



  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {


    final selections =
        ref.watch(optionSelectionProvider);



    final selectedItems = <_SummaryItem>[];



    double total = 0;



    for(final option in options) {


      final optionSelection =
          selections.selectedItems[option.id];



      if(optionSelection == null) {
        continue;
      }



      for(final item in option.items) {


        final quantity =
            optionSelection.quantityOf(
              item.id,
            );



        if(quantity <= 0) {
          continue;
        }



        selectedItems.add(
          _SummaryItem(
            name: item.name,
            quantity: quantity,
            price: item.additionalPrice,
          ),
        );



        total +=
            item.additionalPrice * quantity;

      }

    }



    if(selectedItems.isEmpty) {

      return const SizedBox.shrink();

    }



    return Container(

      width:
          double.infinity,


      padding:
          const EdgeInsets.fromLTRB(
            20,
            12,
            20,
            12,
          ),



      color:
          Theme.of(context)
              .colorScheme
              .surfaceContainerHighest,



      child: Column(

        crossAxisAlignment:
            CrossAxisAlignment.start,


        children: [



          Text(

            "Sélection",

            style:
                Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(

                      fontWeight:
                          FontWeight.bold,

                    ),

          ),



          const SizedBox(
            height: 8,
          ),



          Wrap(

            spacing:
                8,

            runSpacing:
                6,


            children:
                selectedItems
                    .map(

                      (item) =>
                          _SummaryChip(
                            item:item,
                          ),

                    )
                    .toList(),

          ),




          if(total > 0) ...[

            const SizedBox(
              height: 10,
            ),



            Align(

              alignment:
                  Alignment.centerRight,


              child: Text(

                "+${total.toStringAsFixed(2)} €",


                style:
                    Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(

                          fontWeight:
                              FontWeight.bold,

                        ),

              ),

            ),

          ],


        ],

      ),

    );

  }

}





class _SummaryItem {

  final String name;

  final int quantity;

  final double price;



  const _SummaryItem({

    required this.name,

    required this.quantity,

    required this.price,

  });

}





class _SummaryChip extends StatelessWidget {


  final _SummaryItem item;



  const _SummaryChip({

    required this.item,

  });



  @override
  Widget build(BuildContext context) {


    return Container(

      padding:
          const EdgeInsets.symmetric(

            horizontal: 10,

            vertical: 6,

          ),



      decoration: BoxDecoration(

        color:
            Theme.of(context)
                .colorScheme
                .surface,

        borderRadius:
            BorderRadius.circular(
              20,
            ),

      ),



      child: Text(

        item.quantity > 1

            ? "${item.name} x${item.quantity}"

            : item.name,


        style:
            Theme.of(context)
                .textTheme
                .bodyMedium,

      ),

    );

  }

}