import 'package:flutter/material.dart';

class HistoryColumn extends StatelessWidget {
  final List<int> items;

  const HistoryColumn({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[850],
      child: Column(
        children: [
          Text("Historial", style: TextStyle(color: Colors.white)),
          Expanded(
            child: ListView(
              children: items
                  .map((e) => Text(
                        "$e",
                        style: TextStyle(color: Colors.green),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}s