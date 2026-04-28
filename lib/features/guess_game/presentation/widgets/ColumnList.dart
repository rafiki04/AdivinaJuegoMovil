import 'package:flutter/material.dart';

class ColumnList extends StatelessWidget {
  final String title;
  final List<int> items;
  final bool center;
  final Color? itemColor;

  const ColumnList({
    super.key,
    required this.title,
    required this.items,
    this.center = false,
    this.itemColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),

          Expanded(
            child: ListView(
              children: items
                  .map(
                    (e) => Align(
                      alignment: center
                          ? Alignment.center
                          : Alignment.centerLeft,
                      child: Text(
                        "$e",
                        style: TextStyle(color: itemColor),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}