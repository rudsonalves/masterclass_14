import 'package:elements2/ui/features/home_page_element.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AppBase());
}

class AppBase extends Widget {
  const AppBase({super.key});

  @override
  Element createElement() => HomePageElement(this);
}
