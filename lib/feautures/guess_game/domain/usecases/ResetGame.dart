import 'dart:math';
import 'package:game/features/guess_game/domain/entites/juego.dart';


class ResetGame {
  Game call(int maxNumber, int attempts, [List<int> previousHistory = const [], List<int> previousLossHistory = const []]) {
    return Game(
      secretNumber: Random().nextInt(maxNumber) + 1,
      maxNumber: maxNumber,
      attemptsLeft: attempts,
      higherNumbers: [],
      lowerNumbers: [],
      winHistory: previousHistory,
      gameOver: false,
      lossHistory: previousLossHistory,
    );
  }
}