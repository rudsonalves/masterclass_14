import 'dart:io';

class DotEnv {
  final String path;

  DotEnv(this.path);

  Future<Map<String, dynamic>> parseFile() async {
    final file = File(path);

    if (!await file.exists()) {
      throw Exception('File $path not found!');
    }

    final lines = await file.readAsLines();
    final result = <String, dynamic>{};
    int countLine = 0;
    for (final line in lines) {
      // Limpa as linhas removendo espaços e comentários
      final cleanLine = _cleanLine(line);
      if (cleanLine.isNotEmpty) {
        // Separa campos
        final splitLine = cleanLine.split('=');
        if (splitLine.length != 2) {
          throw Exception('Bad formatting on the line $countLine');
        }
        final value = _parseField(splitLine[1]);
        result[splitLine[0]] = value;
      }
      countLine++;
    }

    return result;
  }

  String _cleanLine(String line) {
    // Limpa as linhas removendo espaços e comentários
    String cleanLine = line.trim();
    // Remove commentários
    final hashTagIndex = cleanLine.indexOf('#');
    if (hashTagIndex >= 0) {
      // Armazena as linhas com conteúto não nulo para análise
      cleanLine = cleanLine.substring(0, hashTagIndex).trim();
    }
    return cleanLine;
  }

  dynamic _parseField(String field) {
    final erIsDouble = RegExp(r'^[\d]+\.[\d]*$');
    final erIsInt = RegExp(r'^[\d]+$');
    final erIsBool = RegExp(r'^(true|false)$');

    String aux = _removeQuotes(field);

    dynamic edited = '';
    if (erIsInt.hasMatch(aux)) {
      edited = int.parse(aux);
    } else if (erIsDouble.hasMatch(aux)) {
      edited = double.parse(aux);
    } else if (erIsBool.hasMatch(aux.toLowerCase())) {
      edited = bool.parse(aux.toLowerCase());
    } else {
      edited = aux;
    }
    return edited;
  }

  String _removeQuotes(String value) {
    String edited = value.trim();
    if (edited[0] == '"' && edited[value.length - 1] == '"') {
      edited = edited.substring(1, value.length - 1);
    } else if (edited[0] == "'" && edited[value.length - 1] == "'") {
      edited = edited.substring(1, value.length - 1);
    }
    return edited.trim();
  }
}
