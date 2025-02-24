import 'dart:io';

import 'package:masterclass_14/dot_env.dart';
import 'package:test/test.dart';

void main() {
  group('DotEnv...', () {
    late Directory tempDir;
    late String filePath;

    setUp(() async {
      // Cria diretório para testes
      tempDir = await Directory.systemTemp.createTemp('dotenv_test');
      filePath = '${tempDir.path}/teste.env';
    });

    tearDown(() async {
      // Remove diretório de testes
      await tempDir.delete(recursive: true);
    });

    test('Deve lançar exceção de o arquivo não existir...', () async {
      final noExistFilePath = '${tempDir.path}/fool.env';
      final dotEnv = DotEnv(noExistFilePath);
      expect(dotEnv.parseFile(), throwsException);
    });

    test('Deve ler e interpretar o arquivo...', () async {
      // Iniciar o arquivo de teste
      final content = '''
DATABASE_URL="http://DATABASE"

IS_ADMIN=true
IS_USER=False
HAVE_PASSWORD=FALSE
REFRESH_TIME=123454 # second
VALUE=34.563
VALUE2=45.345.345.34
# isto é um comentário
PATH="./"
  # Isto também é um comentário
GO='~/.bin/go/'
''';
      final file = File(filePath);
      await file.writeAsString(content);

      final dotEnv = DotEnv(filePath);
      final result = await dotEnv.parseFile();

      expect(result, isA<Map<String, dynamic>>());
      expect(result.length, equals(9));
      expect(result['DATABASE_URL'], equals('http://DATABASE'));
      expect(result['IS_ADMIN'], isTrue);
      expect(result['IS_USER'], isFalse);
      expect(result['HAVE_PASSWORD'], isFalse);
      expect(result['REFRESH_TIME'], equals(123454));
      expect(result['VALUE'], equals(34.563));
      expect(result['PATH'], equals('./'));
      expect(result['GO'], equals('~/.bin/go/'));
    });
  });
}
