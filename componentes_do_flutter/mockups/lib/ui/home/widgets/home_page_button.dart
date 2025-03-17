import 'package:flutter/material.dart';

class HomePageButton extends StatelessWidget {
  final void Function() onPressed;
  final String? imagePath;
  final String label;
  final Color? backgroundColor;
  final Color? fontColor;

  const HomePageButton({
    super.key,
    required this.onPressed,
    this.imagePath,
    required this.label,
    this.backgroundColor,
    this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: SizedBox(
        width: double.infinity,
        height: 46,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: onPressed,
          icon:
              imagePath != null
                  ? SizedBox(
                    height: 28,
                    width: 28,
                    child: Image.asset(imagePath!),
                  )
                  : null,
          label: Text(label, style: TextStyle(fontSize: 18, color: fontColor)),
        ),
      ),
    );
  }
}
