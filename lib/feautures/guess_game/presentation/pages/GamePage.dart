import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:game/features/guess_game/presentation/state/GameProvider.dart';
import 'package:game/features/guess_game/presentation/widgets/ColumnList.dart';
import '../widgets/InputBox.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double difficulty = 1;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<GameProvider>();
    final game = provider.game;

    if (game == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 30),

          Slider(
            value: difficulty,
            min: 1,
            max: 4,
            divisions: 3,
            label: difficulty.toString(),
            onChanged: (value) {
              setState(() => difficulty = value);
              if (value == 1) {
                provider.changeDifficulty(10, 5);
              } else if (value == 2) {
                provider.changeDifficulty(20, 8);
              } else if (value == 3) {
                provider.changeDifficulty(100, 15);
              } else {
                provider.changeDifficulty(1000, 25);
              }
            },
          ),

          if (provider.errorMessage != null)
            Text(
              provider.errorMessage!,
              style: const TextStyle(color: Colors.red),
            ),

          Text(
            "Intentos: ${game.attemptsLeft}",
            style: const TextStyle(color: Colors.white),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: Row(
              children: [
                // Columna Mayor que
                Expanded(
                  child: ColumnList(
                    title: "Mayor que",
                    items: game.higherNumbers,
                    center: true,
                  ),
                ),

                // Columna Menor que
                Expanded(
                  child: ColumnList(
                    title: "Menor que",
                    items: game.lowerNumbers,
                    center: true,
                  ),
                ),

                // Columna Historial (verde = aciertos, rojo = derrotas)
                Expanded(
                  child: Container(
                    color: Colors.grey[900],
                    child: Column(
                      children: [
                        const Text(
                          "Historial",
                          style: TextStyle(color: Colors.white),
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              ...game.winHistory.map((e) => Center(
                                    child: Text(
                                      "$e",
                                      style: const TextStyle(color: Colors.green),
                                    ),
                                  )),
                              ...game.lossHistory.map((e) => Center(
                                    child: Text(
                                      "$e",
                                      style: const TextStyle(color: Colors.red),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          InputBox(
            onSubmit: (value) {
              context.read<GameProvider>().guess(value);
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}