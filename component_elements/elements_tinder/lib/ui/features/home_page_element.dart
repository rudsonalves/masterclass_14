import 'package:elements/core/theme_colors.dart';
import 'package:elements/ui/components/latge_button_widget.dart';
import 'package:elements/ui/components/text_button_widget.dart';
import 'package:elements/ui/components/text_row_widget.dart';
import 'package:elements/ui/components/tinder_logo_widget.dart';
import 'package:flutter/material.dart';

class HomePageElement extends ComponentElement {
  HomePageElement(super.widget);

  void onPressed() {
    debugPrint('Press...');
  }

  @override
  Widget build() {
    return Container(
      color: backgroundColor,
      child: Directionality(
        textDirection:
            TextDirection.ltr, // foi necessário para o alinhamento da Row
        child: Column(
          spacing: 4,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 100),
              child: Row(
                spacing: 6,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TinderLogoWidget(logoSize: 50),
                  Text(
                    'tinder',
                    style: TextStyle(fontSize: 62, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Text('By tapping Create Account or SignIn, you agree to out'),
            TextRowWidget(
              '"Terms". Learn how we process yout data in our "Privacy"',
              onTap: onPressed,
            ),
            TextRowWidget('"Policy" and "Cookies Policy".', onTap: onPressed),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LargeButtonWidget(
                    iconData: Icons.apple,
                    label: 'Sign in with Apple',
                    onPressed: onPressed,
                  ),
                  LargeButtonWidget(
                    iconData: Icons.facebook,
                    label: 'Sign in with Facebook',
                    onPressed: onPressed,
                  ),
                  LargeButtonWidget(
                    iconData: Icons.phone_callback_rounded,
                    label: 'Sign in with Phone Number',
                    onPressed: onPressed,
                  ),
                ],
              ),
            ),
            TextButtonWidget(
              label: 'Trouble Signing In?',
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
