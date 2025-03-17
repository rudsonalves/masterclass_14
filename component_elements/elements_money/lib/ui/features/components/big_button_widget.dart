import 'package:elements2/core/theme_color.dart';
import 'package:flutter/material.dart';

class BigButtonWidget extends Widget {
  final String label;
  final String? image;
  final Color backgroundColor;
  final Color fontColor;
  final void Function() onPressed;

  const BigButtonWidget({
    super.key,
    required this.label,
    this.image,
    this.backgroundColor = white,
    this.fontColor = black,
    required this.onPressed,
  });

  @override
  Element createElement() => BigButtonElement(this);
}

class BigButtonElement extends ComponentElement {
  BigButtonElement(super.widget);

  @override
  Widget build() {
    final button = widget as BigButtonWidget;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Material(
        borderRadius: BorderRadius.circular(6),
        color: button.backgroundColor,
        child: SizedBox(
          height: 50,
          child: InkWell(
            onTap: button.onPressed,
            borderRadius: BorderRadius.circular(6),
            child: Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (button.image != null)
                  Image.asset(button.image!, height: 24),
                Text(
                  button.label,
                  style: TextStyle(
                    color: button.fontColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
