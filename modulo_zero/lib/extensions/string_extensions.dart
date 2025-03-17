extension StringExtensions on String {
  String get onlyNumbers => replaceAll(RegExp(r'[^\d]'), '');

  List<int> get parseToIntList =>
      split('').map((item) => int.parse(item)).toList();
}
