import 'package:elements2/core/theme_color.dart';
import 'package:flutter/material.dart';

class LinkButtonWidget extends Widget {
  final String label;

  final void Function() onPressed;

  const LinkButtonWidget({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Element createElement() => LinkButtonElement(this);
}

class LinkButtonElement extends ComponentElement {
  LinkButtonElement(super.widget);

  @override
  Widget build() {
    final button = widget as LinkButtonWidget;

    return Material(
      color: black,
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        onTap: button.onPressed,
        borderRadius: BorderRadius.circular(50),
        child: Text(
          button.label,
          style: TextStyle(
            color: white,
            decorationColor: white,
            fontSize: 18,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
