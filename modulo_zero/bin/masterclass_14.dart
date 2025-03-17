import 'package:masterclass_14/cpf.dart';
import 'package:masterclass_14/dot_env.dart';
import 'package:masterclass_14/fibonacci.dart';
import 'package:masterclass_14/pessoa.dart';
import 'package:masterclass_14/mod10.dart';
import 'package:masterclass_14/regra_de_3.dart';
import 'package:masterclass_14/vigenere.dart';

void main() async {
  print('Cálculo do IMC:');
  print(Pessoa(name: 'Fulano', weight: 80, height: 1.8));

  print('\nFibonacci:');
  print('Elemento do Fibonacci de ordem 10: ${fibonacci(9)}');
  print('Os primeiros 10 elementos de Fibonacci: ${fibonacciList(10)}');

  print('\nRegra de 3:');
  print('Todos possuem o mesmo resultado, apenas altera a variável');
  print(regraDe3(g12: 3, g21: 6, g22: 2));
  print(regraDe3(g11: 4, g21: 6, g22: 2));
  print(regraDe3(g11: 4, g12: 3, g22: 2));
  print(regraDe3(g11: 4, g12: 3, g21: 6));

  print('\nCPF. Apenas os dois últimos estão incorretos:');
  final cpfs = [
    '272.150.310-39',
    '698.701.380-20',
    '578.335.990-42',
    '689.954.440-70',
    '945.152.370-71',
    '412.214.730-18',
    '478.711.140-00',
    '767.595.520-08',
    '767.595.520-18', // False no dígito 1
    '767.595.520-09', // False no dígito 2
  ];
  for (final cpf in cpfs) {
    print('$cpf - ${Cpf(cpf).validate()}');
  }

  print('\nCard10:');
  final cards = <String, bool>{
    '5419 8250 0346 1210': false,
    '4916 6418 5936 9080': true,
    '5414 6593 4424 4324': true,
    '5316 6433 5691 5459': true,
    '5414 6521 8574 9998': true,
    '5215097724849175': true,
    '5124271696238846': true,
  };
  for (final card in cards.keys) {
    print('Card: $card - ${Card(card).validate()} [expect ${cards[card]}]');
  }

  print('\nCifra de Vigenère:');
  final text =
      'If I have seen further it is by standing on the shoulders'
              ' of giants (Isaac Newton).'
          .toUpperCase();
  final a = Vigenere(text);
  print('   Key: ${a.key}');
  print('Encode: ${a.encode}');
  print('Decode: ${a.decode()}');
  print(' Check: ${text == a.decode()}');

  print('\n\n');
  final text2 =
      'O mundo é um lugar perigoso de se viver, não por causa daqueles que'
              ' fazem o mal, mas sim por causa daqueles que observam e deixam o mal'
              ' acontecer.'
          .toUpperCase();
  final b = Vigenere(text2);
  print('   Key: ${b.key}');
  print('Encode: ${b.encode}');
  print('Decode: ${b.decode()}');
  print(' Check: ${text2 == b.decode()}');

  print('\nDotEnv:');
  const width = 15;
  final f = DotEnv('test.env');
  final result = await f.parseFile();
  print('${'KEY:'.padLeft(width + 1)} ${'VALUE'.padRight(width)} TYPE');
  for (final key in result.keys) {
    final value = result[key];
    print(
      '${key.padLeft(width)}:'
      ' ${value.toString().padRight(width)}'
      ' type: ${value.runtimeType}',
    );
  }
}
