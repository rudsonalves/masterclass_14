import 'package:elements/core/theme_colors.dart';
import 'package:flutter/material.dart';

class LargeButtonWidget extends Widget {
  final IconData iconData;
  final String label;
  final void Function() onPressed;

  const LargeButtonWidget({
    super.key,
    required this.iconData,
    required this.label,
    required this.onPressed,
  });

  @override
  Element createElement() => LargeButtonElement(this);
}

class LargeButtonElement extends ComponentElement {
  LargeButtonElement(super.widget);

  @override
  Widget build() {
    final button = widget as LargeButtonWidget;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      child: Material(
        borderRadius: BorderRadius.circular(50),
        color: backgroundColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: button.onPressed,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: white),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(button.iconData, color: white),
                Expanded(
                  child: Text(
                    button.label.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: white),
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
