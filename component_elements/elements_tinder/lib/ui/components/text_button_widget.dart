import 'package:elements/core/theme_colors.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends Widget {
  final String label;
  final void Function() onPressed;

  const TextButtonWidget({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Element createElement() => TextButtonElement(this);
}

class TextButtonElement extends ComponentElement {
  TextButtonElement(super.widget);

  @override
  Widget build() {
    final button = widget as TextButtonWidget;

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        onTap: button.onPressed,
        borderRadius: BorderRadius.circular(50),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Text(button.label, style: TextStyle(color: white)),
        ),
      ),
    );
  }
}
