class Difficulty {
  final int maxNumber;
  final int attempts;

  const Difficulty(this.maxNumber, this.attempts);

  static const easy = Difficulty(10, 5);
  static const medium = Difficulty(20, 8);
  static const hard = Difficulty(100, 15);
  static const extreme = Difficulty(1000, 25);
}