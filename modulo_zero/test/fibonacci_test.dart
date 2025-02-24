import 'package:masterclass_14/fibonacci.dart';
import 'package:test/test.dart';

void main() {
  test('fibonacci ...', () async {
    final fibo = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377];

    for (int n = 0; n < fibo.length; n++) {
      expect(fibonacci(n), equals(fibo[n]));
    }
  });
}
