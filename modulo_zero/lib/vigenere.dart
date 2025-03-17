import 'dart:math';

class Vigenere {
  late final String _encode;
  late final String _key;

  Vigenere(String text) {
    _key = _generateKey(text.length);
    _encode = _encodeText(text);
  }

  static const String _base = 'qwertyuiopasdfghjklzxcvbnm1234567890';

  String get encode => _encode;
  String get key => _key;

  String decode() {
    // Gera a lista de códigos decodificados
    final List<int> decodeList = _generateDecodeList();

    // Converte em string
    return String.fromCharCodes(decodeList);
  }

  List<int> _generateDecodeList() {
    final encodeCodes = _encode.codeUnits;
    final keyCodes = _key.codeUnits;
    final codeA = 'A'.codeUnitAt(0);

    final List<int> decodeList = [];
    for (int i = 0; i < _key.length; i++) {
      if (_isPunctuation(_encode[i])) {
        decodeList.add(_encode[i].codeUnitAt(0));
      } else {
        int charCode = encodeCodes[i] - keyCodes[i] + 26;
        charCode = charCode % 26 + codeA;
        decodeList.add(charCode);
      }
    }

    return decodeList;
  }

  String _generateKey(int length) {
    Random random = Random();
    String newKey = '';
    for (int i = 0; i < length; i++) {
      newKey += _base[random.nextInt(_base.length)];
    }
    return newKey;
  }

  String _encodeText(String text) {
    final List<int> encodeList = _generateEncondeList(text);

    return String.fromCharCodes(encodeList);
  }

  List<int> _generateEncondeList(String text) {
    final codes = text.codeUnits;
    final keyCodes = _key.codeUnits;
    final codeA = 'A'.codeUnitAt(0);

    final List<int> encodeList = [];
    for (int i = 0; i < text.length; i++) {
      final currentChar = text[i];
      if (_isPunctuation(currentChar)) {
        encodeList.add(currentChar.codeUnitAt(0));
      } else {
        final newcode = (codes[i] + keyCodes[i]) % 26 + codeA;
        encodeList.add(newcode);
      }
    }

    return encodeList;
  }

  bool _isPunctuation(String label) {
    final reg = RegExp(r'[^\w]');

    return reg.hasMatch(label);
  }
}
