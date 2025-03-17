import 'package:elements2/core/theme_color.dart';
import 'package:flutter/material.dart';

class TitleTextWidget extends Widget {
  final String text1;
  final String text2;
  final double fontSize;
  final Color fontColor;
  final double verticalPadding;

  const TitleTextWidget({
    super.key,
    required this.text1,
    required this.text2,
    this.fontSize = 42,
    this.fontColor = white,
    this.verticalPadding = 34,
  });

  @override
  Element createElement() => TitleTextElement(this);
}

class TitleTextElement extends ComponentElement {
  TitleTextElement(super.widget);

  @override
  Widget build() {
    final titleText = widget as TitleTextWidget;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: titleText.verticalPadding),
      child: Column(
        children: [
          Text(
            titleText.text1,
            style: TextStyle(
              fontSize: titleText.fontSize,
              fontWeight: FontWeight.bold,
              color: titleText.fontColor,
            ),
          ),
          Text(
            titleText.text2,
            style: TextStyle(
              fontSize: titleText.fontSize,
              fontWeight: FontWeight.bold,
              color: titleText.fontColor,
            ),
          ),
        ],
      ),
    );
  }
}
