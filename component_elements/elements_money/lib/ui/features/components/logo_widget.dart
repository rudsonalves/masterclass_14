import 'package:elements2/core/theme_color.dart';
import 'package:flutter/material.dart';

class LogoWidget extends Widget {
  final double logoSize;
  const LogoWidget({super.key, this.logoSize = 200});

  @override
  Element createElement() => LogoElement(this);
}

class LogoElement extends ComponentElement {
  LogoElement(super.widget);

  @override
  Widget build() {
    final size = (widget as LogoWidget).logoSize;
    final spacingFraction = 0.06;

    return Row(
      spacing: size * spacingFraction,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          spacing: size * spacingFraction,
          children: [
            Container(
              width: size / 2,
              height: size / 2,
              decoration: BoxDecoration(
                color: blueColor,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
            ),
            Container(
              width: size / 2,
              height: size / 2,
              decoration: BoxDecoration(
                color: blueColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(size / 2),
                ),
              ),
            ),
          ],
        ),
        Container(
          width: size / 2,
          height: size * (1 + spacingFraction),
          decoration: BoxDecoration(
            color: blueColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(size / 2),
              topRight: Radius.circular(size / 2),
            ),
          ),
        ),
      ],
    );
  }
}
