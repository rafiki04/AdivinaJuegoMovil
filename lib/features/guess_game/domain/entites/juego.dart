class Game {
  final int secretNumber;
  final int maxNumber;
  final int attemptsLeft;

  final List<int> higherNumbers;
  final List<int> lowerNumbers;
  final List<int> lossHistory;

  
  final List<int> winHistory;

  final bool gameOver;

  Game({
    this.lossHistory=const [],
    required this.secretNumber,
    required this.maxNumber,
    required this.attemptsLeft,
    this.higherNumbers = const [],
    this.lowerNumbers = const [],
    this.winHistory = const [],
    this.gameOver = false,
  });

  Game copyWith({
    int? attemptsLeft,
    List<int>? higherNumbers,
    List<int>? lowerNumbers,
    List<int>? winHistory,
    bool? gameOver,
    List<int>? lossHistory,
  }) {
    return Game(
      secretNumber: secretNumber,
      maxNumber: maxNumber,
      attemptsLeft: attemptsLeft ?? this.attemptsLeft,
      higherNumbers: higherNumbers ?? this.higherNumbers,
      lowerNumbers: lowerNumbers ?? this.lowerNumbers,
      winHistory: winHistory ?? this.winHistory,
      gameOver: gameOver ?? this.gameOver,
      lossHistory: lossHistory ?? this.lossHistory,
    );
  }
}