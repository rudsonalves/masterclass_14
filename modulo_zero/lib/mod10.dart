import 'package:masterclass_14/extensions/string_extensions.dart';

class Card {
  final String number;

  Card(this.number);

  bool validate() {
    final onlyNumbers = number.onlyNumbers;
    if (onlyNumbers.length != 16) {
      throw Exception('Número de cartão deve ter 16 números');
    }
    final digits = onlyNumbers.parseToIntList;
    final lastdigit = digits.last;

    final checkDigit = _calculateValidationNumber(digits.sublist(0, 15));

    return checkDigit == lastdigit;
  }

  int _calculateValidationNumber(List<int> digits) {
    final values = _calculateElements(digits);

    final sum = _sumValues(values);

    final mod = 10 - sum % 10;
    final checkDigit = mod == 10 ? 0 : mod;

    return checkDigit;
  }

  List<int> _calculateElements(List<int> digits) {
    bool isEven = true;
    final values = <int>[];
    for (int d in digits) {
      final int mult = isEven == true ? 2 : 1;
      int value = d * mult;
      if (value > 9) {
        value = 1 + value - 10;
      }
      isEven = !isEven;
      values.add(value);
    }

    return values;
  }

  int _sumValues(List<int> values) {
    return values.fold(0, (previous, element) => previous + element);
  }
}
