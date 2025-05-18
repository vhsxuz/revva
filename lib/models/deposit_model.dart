class DepositModel {
  static double _amount = 0.0;

  static double get amount => _amount;

  static void addDigit(int digit) {
    _amount = _amount * 10 + digit.toDouble();
  }

  static void deleteLastDigit() {
    _amount = (_amount / 10).floorToDouble();
  }

  static void reset() {
    _amount = 0.0;
  }

  static String get formattedAmount {
    if (_amount == 0) return '0';
    return '${_amount.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]}.',
        )}';
  }
}