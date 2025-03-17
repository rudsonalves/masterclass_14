import 'package:elements/core/theme_colors.dart';
import 'package:flutter/material.dart';

class TextLinkWidget extends Widget {
  final String label;

  final void Function() onPressed;

  const TextLinkWidget({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Element createElement() => TextLinkElement(this);
}

class TextLinkElement extends ComponentElement {
  TextLinkElement(super.widget);

  @override
  Widget build() {
    final button = widget as TextLinkWidget;

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        onTap: button.onPressed,
        borderRadius: BorderRadius.circular(50),
        child: Text(
          button.label,
          style: TextStyle(
            color: white,
            decorationColor: white,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
