import 'package:flutter/material.dart';

import '../../domain/entites/juego.dart';
import '../../domain/usecases/MakeGuess.dart';
import '../../domain/usecases/ResetGame.dart';
import 'package:game/core/services/SoundService.dart';

class GameProvider extends ChangeNotifier {
  Game? game;
  String? errorMessage;

  final MakeGuess makeGuess;
  final ResetGame resetGame;
  int _prevWinCount = 0;

  GameProvider(this.makeGuess, this.resetGame);

  void start(int max, int attempts) {
    final previousWinHistory = game?.winHistory ?? [];
    final previousLossHistory = game?.lossHistory ?? [];
    game = resetGame(max, attempts, previousWinHistory, previousLossHistory);
    errorMessage = null;
    notifyListeners();
  }

  void changeDifficulty(int max, int attempts) {
    start(max, attempts);
  }

  int _attemptsForMax(int max) {
    if (max == 10) return 5;
    if (max == 20) return 8;
    if (max == 100) return 15;
    return 25;
  }

  void guess(String input) {
    if (game == null) return;

    final number = int.tryParse(input);

    if (number == null) {
      errorMessage = "Solo números permitidos";
      notifyListeners();
      return;
    }

    if (number < 1 || number > game!.maxNumber) {
      errorMessage = "Fuera de rango (1 - ${game!.maxNumber})";
      notifyListeners();
      return;
    }

    errorMessage = null;

    _prevWinCount = game!.winHistory.length;

    game = makeGuess(game!, number);
    notifyListeners();

    if (game!.gameOver) {
      final bool didWin = game!.winHistory.length > _prevWinCount;

      if (didWin) {
        SoundService.playWin();
      } else {
        SoundService.playLose();
      }

      Future.delayed(const Duration(milliseconds: 500), () {
        final previousWinHistory = game?.winHistory ?? [];
        final previousLossHistory = game?.lossHistory ?? [];
        final currentMax = game!.maxNumber;
        final currentAttempts = _attemptsForMax(currentMax);
        game = resetGame(currentMax, currentAttempts, previousWinHistory, previousLossHistory);
        notifyListeners();
      });
    }
  }
}