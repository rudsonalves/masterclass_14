class Pessoa {
  String name;
  double weight;
  double height;

  Pessoa({required this.name, required this.weight, required this.height});

  double get imc {
    if (height * weight == 0) {
      throw Exception('Peso e altura não podem ser nulos!');
    }
    return weight / (height * height);
  }

  String get imcAvaliation {
    final value = imc;
    final imcString = 'IMC: ${value.toStringAsFixed(1)}';
    if (value < 18.5) {
      return '$imcString [menor que 18.5] - Magreza: Obesidade grau 0';
    } else if (value < 25.0) {
      return '$imcString [entre 18.5 e 24.9] - Normal: Obesidade grau 0';
    } else if (value < 30.0) {
      return '$imcString [entre 25.0 e 29.9] - Sobrepeso: Obesidade grau I';
    } else if (value < 40.0) {
      return '$imcString [entre 30.0 e 39.9] - Obesidade: Obesidade grau II';
    } else {
      return '$imcString [maior que 40.0] - Obesidade Grave: Obesidade grau III';
    }
  }

  @override
  String toString() {
    return '$name,'
        ' de peso ${weight}kg'
        ' e altura ${height}m,'
        ' possui IMC ${imc.toStringAsFixed(2)}kg/m²';
  }
}
