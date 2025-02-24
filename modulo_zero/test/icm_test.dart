import 'package:masterclass_14/pessoa.dart';
import 'package:test/test.dart';

void main() {
  test('icm ...', () async {
    expect(
      Pessoa(name: 'Rau', weight: 80, height: 1.8).imcAvaliation,
      equals('IMC: 15.4 [menor que 18.5] - Magreza: Obesidade grau 0'),
    );
    expect(
      Pessoa(name: 'Rau', weight: 80, height: 1.8).imcAvaliation,
      equals('IMC: 24.7 [entre 18.5 e 24.9] - Normal: Obesidade grau 0'),
    );
    expect(
      Pessoa(name: 'Rau', weight: 90, height: 1.8).imcAvaliation,
      equals('IMC: 27.8 [entre 25.0 e 29.9] - Sobrepeso: Obesidade grau I'),
    );
    expect(
      Pessoa(name: 'Rau', weight: 120, height: 1.8).imcAvaliation,
      equals('IMC: 37.0 [entre 30.0 e 39.9] - Obesidade: Obesidade grau II'),
    );
    expect(
      Pessoa(name: 'Rau', weight: 180, height: 1.8).imcAvaliation,
      equals(
        'IMC: 55.6 [maior que 40.0] - Obesidade Grave: Obesidade grau III',
      ),
    );
  });
}
