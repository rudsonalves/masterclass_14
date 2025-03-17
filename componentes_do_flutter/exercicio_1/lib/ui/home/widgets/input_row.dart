import 'package:flutter/material.dart';
import 'package:responsividade/ui/home/widgets/form_text.dart';

class InputRow extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const InputRow({super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormText(label: label),
        SizedBox(
          width: 300,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
        ),
      ],
    );
  }
}
