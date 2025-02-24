import 'package:masterclass_14/cpf.dart';
import 'package:test/test.dart';

void main() {
  test('cpf ...', () {
    final cpfs = [
      ('272.150.310-39', true),
      ('698.701.380-20', true),
      ('578.335.990-42', true),
      ('689.954.440-70', true),
      ('945.152.370-71', true),
      ('412.214.730-18', true),
      ('478.711.140-00', true),
      ('767.595.520-08', true),
      ('767.595.520-18', false),
      ('767.595.520-09', false),
    ];
    for (final (cpf, matcher) in cpfs) {
      expect(Cpf(cpf).validate(), equals(matcher));
    }
  });
}
