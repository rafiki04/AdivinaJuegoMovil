class Validators {
  static bool isValidNumber(String value, int max) {
    final number = int.tryParse(value);
    if (number == null) return false;
    if (number < 1 || number > max) return false;
    return true;
  }
}