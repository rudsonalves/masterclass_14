int fibonacci(int n) {
  if (n < 2) {
    return n;
  }
  return fibonacci(n - 1) + fibonacci(n - 2);
}

List<int> fibonacciList(int n) {
  final fib = <int>[];

  for (int i = 0; i < n; i++) {
    fib.add(fibonacci(i));
  }

  return fib;
}
