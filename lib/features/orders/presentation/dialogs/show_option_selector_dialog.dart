import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/catalog/data/repositories/product_repository_provider.dart';

import 'package:pos_app/features/catalog/domain/entities/product.dart';
import 'package:pos_app/features/orders/domain/entities/order_item_option.dart';
import 'package:pos_app/features/orders/presentation/widgets/option_selector/option_selector.dart';

Future<List<OrderItemOption>?> showOptionSelectorDialog({
  required BuildContext context,
  required WidgetRef ref,
  required Product product,
}) async {
  final options = (product.options ?? [])
      .map(
        (option) => option.copyWith(
          items: ref
              .read(productsProvider)
              .items
              .where(
                (item) => item.option.id == option.id,
              )
              .toList(),
        ),
      )
      .toList();

  return showDialog<List<OrderItemOption>>(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return Dialog(
        insetPadding: const EdgeInsets.all(32),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            24,
          ),
        ),
        child: OptionSelector(
          title: product.name,
          options: options,
        ),
      );
    },
  );
}
