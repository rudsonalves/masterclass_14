void main() {
  List<String> cards = [
    '4916 6418 5936 9080', // Cartão válido
    '5419 8250 0346 1210', // Cartão inválido
    '5486-3656-8140-9495', // Cartão válido
  ];

  for (final card in cards) {
    print('Cartão $card é ${validarCartao(card) ? 'válido' : 'inválido'}');
  }
}

bool validarCartao(String number) {
  final cardNumber = number
      .replaceAll(' ', '')
      .replaceAll('-', '')
      .replaceAll('.', '');

  int resultado = 0;
  int ultimoDigito = int.parse(cardNumber[cardNumber.length - 1]);

  for (int i = 0; i < cardNumber.length - 1; i++) {
    int numero = int.parse(cardNumber[i]);

    if (i % 2 == 0) {
      numero *= 2;
      if (numero > 9) {
        numero = (numero ~/ 10) + (numero % 10);
      }
    }

    resultado += numero;
  }

  int resto = resultado % 10;

  int resultadoFinal = (10 - resto) % 10;

  if (resultadoFinal == ultimoDigito) {
    return true;
  } else {
    return false;
  }
}
