import 'package:flutter/material.dart';

class CategoryExpansionTile extends StatefulWidget {
  const CategoryExpansionTile({
    super.key,
    required this.name,
    required this.isSelected,
    required this.level,
    required this.onSelect,
    required this.children,
  });

  final String name;
  final bool isSelected;
  final int level;
  final VoidCallback onSelect;
  final List<Widget> children;

  @override
  State<CategoryExpansionTile> createState() => _CategoryExpansionTileState();
}

class _CategoryExpansionTileState extends State<CategoryExpansionTile> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    final bgColor =
        widget.isSelected ? Colors.blueGrey.shade500 : Colors.transparent;

    final textColor = widget.isSelected ? Colors.white : Colors.black;

    return Padding(
      padding: EdgeInsets.only(left: widget.level * 8),
      child: Column(
        children: [
          InkWell(
            onTap: widget.onSelect,
            child: Container(
              width: double.infinity,
              color: bgColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 6,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.name,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: widget.isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: AnimatedRotation(
                      turns: isExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        Icons.expand_more,
                        color: textColor,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          if (isExpanded) ...widget.children,
        ],
      ),
    );
  }
}