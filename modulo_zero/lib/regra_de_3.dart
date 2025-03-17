List<double?> regraDe3({double? g11, double? g12, double? g21, double? g22}) {
  final values = [g11, g12, g21, g22];

  int unknowIndex = findUnknowIndex(values);

  return _solveVariable(values, unknowIndex);
}

int findUnknowIndex(List<double?> values) {
  int unknowIndex = 0;
  final countNotNull = values.fold<int>(0, (previus, next) {
    if (next == null) {
      unknowIndex = previus;
    } else {
      previus++;
    }

    return previus;
  });
  print('Unknow index: $unknowIndex');

  if (countNotNull != 3) {
    throw Exception('Só pode haver um valor desconhecido!');
  }

  return unknowIndex;
}

List<double?> _solveVariable(List<double?> values, int unknowIndex) {
  switch (unknowIndex) {
    case 0:
      values[0] = values[2]! * values[3]! / values[1]!;
      break;
    case 1:
      values[1] = values[2]! * values[3]! / values[0]!;
      break;
    case 2:
      values[2] = values[0]! * values[1]! / values[3]!;
      break;
    case 3:
      values[3] = values[0]! * values[1]! / values[2]!;
      break;
  }

  return values;
}
