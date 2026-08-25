import 'package:flutter/material.dart';

import 'package:pos_app/features/catalog/domain/entities/option.dart';


class OptionConstraints extends StatelessWidget {

  final Option option;

  const OptionConstraints({
    super.key,
    required this.option,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme =
        Theme.of(context)
            .colorScheme;

    final constraints = <String>[];

    if(option.isMandatory) {
      constraints.add("Obligatoire");
    } else {
      constraints.add("Facultatif");
    }

    constraints.add(
      "Minimum ${option.minSelection}",
    );

    constraints.add(
      "Maximum ${option.maxSelection}",
    );

    return Padding(
      padding:
          const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 8,
          ),
      child: Row(
        children: [
          Icon(
            option.isMandatory
                ? Icons.info_outline
                : Icons.tune,
            size: 20,
            color: colorScheme.primary,
          ),

          const SizedBox(
            width: 8,
          ),

          Expanded(
            child: Text(
              constraints.join(" • "),
              style:
                  Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                        fontWeight:
                            FontWeight.w500,
                      ),
            ),
          ),
        ],
      ),
    );
  }
}