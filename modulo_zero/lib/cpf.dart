import 'package:masterclass_14/extensions/string_extensions.dart';

class Cpf {
  String cpf;

  Cpf(this.cpf);

  bool validate() {
    // Remove caracteres não numéricos
    final numbers = cpf.onlyNumbers;

    // Deve ter 11 caracteres
    if (numbers.length != 11) return false;

    // Verifica se todos os algarismos são '1'
    if (numbers == '11111111111') return false;

    // Separa os 9 primeiros dígitos
    final digits = numbers.substring(0, 9).parseToIntList;

    // Separa os dígitos
    final d1 = int.parse(numbers[9]);
    final d2 = int.parse(numbers[10]);

    final digit1 = _caltulateDigit(digits);

    if (d1 != digit1) return false;

    digits.add(d1);
    final digit2 = _caltulateDigit(digits);

    if (d2 != digit2) return false;

    return true;
  }

  int _caltulateDigit(List<int> digits) {
    // Inicia o peso
    int weight = digits.length + 1;
    int sum = digits.fold(0, (previous, value) {
      final result = previous + value * weight;
      weight--;
      return result;
    });

    final mod = sum % 11;

    final d1 = 11 - mod;

    return d1 < 10 ? d1 : 0;
  }
}
