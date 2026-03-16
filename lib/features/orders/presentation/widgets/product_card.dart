import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final bool isGroup;
  final String name;
  final double? price;
  final String? image;
  final IconData? icon;
  final String? description;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.isGroup,
    required this.name,
    this.price,
    this.image,
    this.icon,
    this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [

                if (image != null)
                  Expanded(
                    child: Image.network(
                      image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null)
                      Icon(
                        icon,
                        size: 40,
                      ),
                      Text(
                        name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold),
                      ),
                  ],
                ),
                
                

                if (!isGroup)
                  Text("${price!.toStringAsFixed(2)} €"),
              ],
            ),

            /// DESCRIPTION ICON
            if (!isGroup && description != null)
              Positioned(
                right: 4,
                top: 4,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(name),
                        content: Text(description!),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.info,
                    size: 18,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}