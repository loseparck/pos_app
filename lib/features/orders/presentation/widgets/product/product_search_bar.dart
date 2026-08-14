import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/core/theme/app_radius.dart';
import 'package:pos_app/core/theme/app_spacing.dart';
import 'package:pos_app/core/theme/app_colors.dart';
import 'package:pos_app/features/orders/data/repositories/order_repository_provider.dart';

import 'dart:async';

class ProductSearchBar extends ConsumerStatefulWidget {
  const ProductSearchBar({super.key});

  @override
  ConsumerState<ProductSearchBar> createState() =>
      _ProductSearchBarState();
}

class _ProductSearchBarState
    extends ConsumerState<ProductSearchBar> {
  late final TextEditingController _controller;

  Timer? _debounce;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(
      text: ref.read(posProvider).search,
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    _debounce?.cancel();
 
    _debounce = Timer(
      const Duration(milliseconds: 250),
      () {
        ref.read(posProvider.notifier).search(value);
      },
    );
  }

  void _clear() {
    _debounce?.cancel();

    _controller.clear();

    ref.read(posProvider.notifier).clearSearch();
  }

  @override
  Widget build(BuildContext context) {
    final search = ref.watch(
      posProvider.select((e) => e.search),
    );

    if (_controller.text != search) {
      _controller.value = TextEditingValue(
        text: search,
        selection: TextSelection.collapsed(
          offset: search.length,
        ),
      );
    }

    return SizedBox(
      height: 48,
      child: TextField(
        controller: _controller,
        onChanged: _onChanged,
        decoration: InputDecoration(
          hintText: "Rechercher un produit",

          prefixIcon: const Icon(Icons.search),

          suffixIcon: search.isEmpty
              ? null
              : IconButton(
                  onPressed: _clear,
                  icon: const Icon(Icons.clear),
                ),

          filled: true,
          fillColor: Colors.white,

          contentPadding: AppSpacing.horizontal,

          enabledBorder: OutlineInputBorder(
            borderRadius: AppRadius.button,
            borderSide: const BorderSide(
              color: AppColors.border,
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: AppRadius.button,
            borderSide: const BorderSide(
              color: AppColors.primary,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}