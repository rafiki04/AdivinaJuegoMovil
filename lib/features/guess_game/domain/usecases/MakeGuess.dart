import 'package:AdivinaJuegoMovil/features/guess_game/domain/entites/juego.dart';

class MakeGuess {
  Game call(Game game, int input) {
    if (game.gameOver) return game;
    if (game.attemptsLeft <= 0) return game;

    final bool isWin = input == game.secretNumber;
    final int attempts = (game.attemptsLeft - 1).clamp(0, game.attemptsLeft);

    final newLossHistory = (!isWin && attempts == 0)
    ? [...game.lossHistory, game.secretNumber]
    : game.lossHistory;

    final newHigher = input < game.secretNumber
        ? [...game.higherNumbers, input]
        : game.higherNumbers;

    final newLower = input > game.secretNumber
        ? [...game.lowerNumbers, input]
        : game.lowerNumbers;

    final newWinHistory = isWin
        ? [...game.winHistory, game.secretNumber]
        : game.winHistory;

  return game.copyWith(
  attemptsLeft: attempts,
  higherNumbers: newHigher,
  lowerNumbers: newLower,
  winHistory: newWinHistory,
  lossHistory: newLossHistory,
  gameOver: isWin || attempts == 0,
    );
  }
}