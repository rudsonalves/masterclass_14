import 'package:flutter/material.dart';
import 'package:responsividade/core/theme/theme.dart';

class AppSettings {
  AppSettings._();
  static final AppSettings _instance = AppSettings._();
  static AppSettings get instance => _instance;

  late Brightness _brightness;
  late TextTheme _textTheme;
  late MaterialTheme _materialTheme;

  Brightness get brightness => _brightness;
  TextTheme get textTheme => _textTheme;
  MaterialTheme get materialTheme => _materialTheme;
  ThemeData get theme => _materialTheme.light();

  void init(Brightness brightness, TextTheme textTheme) {
    _brightness = brightness;
    _textTheme = textTheme;

    _materialTheme = MaterialTheme(textTheme);
  }
}
