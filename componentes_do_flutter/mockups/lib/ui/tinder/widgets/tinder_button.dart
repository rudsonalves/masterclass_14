import 'package:flutter/material.dart';

class TinderButton extends StatelessWidget {
  final void Function() onPressed;
  final String label;
  final Color color;
  final IconData iconData;

  const TinderButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.color = Colors.white,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton(
        style: ButtonStyle(
          side: WidgetStatePropertyAll(BorderSide(color: color, width: 2)),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(iconData, size: 28, color: color),
            Expanded(
              child: Text(
                label.toUpperCase(),
                style: TextStyle(color: color, fontSize: 17),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
