import 'package:flutter/material.dart';

class FormText extends StatelessWidget {
  final String label;
  const FormText({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(label, style: TextStyle(fontSize: 18));
  }
}
