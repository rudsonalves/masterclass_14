import 'package:elements/ui/components/text_link_widget.dart';
import 'package:flutter/material.dart';

class TextRowWidget extends Widget {
  final String text;
  final void Function() onTap;

  const TextRowWidget(this.text, {super.key, required this.onTap});

  @override
  Element createElement() => TextRowElement(this);
}

class TextRowElement extends ComponentElement {
  TextRowElement(super.widget);

  @override
  Widget build() {
    final textRow = widget as TextRowWidget;
    final textSplit = textRow.text.split('"');

    bool underlineMode = false;

    final List<Widget> rowItens = [];
    for (final text in textSplit) {
      if (text.isEmpty) {
        underlineMode = !underlineMode;
        continue;
      }
      rowItens.add(
        !underlineMode
            ? Text(text)
            : TextLinkWidget(label: text, onPressed: textRow.onTap),
      );
      underlineMode = !underlineMode;
    }

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: rowItens);
  }
}
