import 'dart:io';

import 'package:flutter/material.dart';

class ImageRowWidget extends StatelessWidget {
  final String? imageUrl;

  const ImageRowWidget({super.key, 
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: const Color(0xFFF1EDFF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: imageUrl == null
          ? const Icon(
              Icons.inventory_2_outlined,
              color: Color(0xFF7C3AED),
              size: 20,
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: 
                imageUrl!.startsWith('http') ?
                  Image.network(
                    imageUrl!,
                    fit: BoxFit.cover,
                  )
                : Image.file(
                    File(imageUrl!),
                    fit: BoxFit.cover,
                  )
            ),
    );
  }
}
