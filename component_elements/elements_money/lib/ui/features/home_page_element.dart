import 'package:elements2/core/theme_color.dart';
import 'package:elements2/ui/features/components/big_button_widget.dart';
import 'package:elements2/ui/features/components/link_button_widget.dart';
import 'package:elements2/ui/features/components/logo_widget.dart';
import 'package:elements2/ui/features/components/title_text_widget.dart';
import 'package:flutter/material.dart';

class HomePageElement extends ComponentElement {
  HomePageElement(super.widget);

  void onpressed() {
    debugPrint('Button pressed!');
  }

  @override
  Widget build() {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: LogoWidget(logoSize: 100),
          ),
          TitleTextWidget(text1: 'Get your Money', text2: 'Under Control'),
          TitleTextWidget(
            text1: 'Manager your expenses',
            text2: 'Seamlessly',
            fontSize: 28,
            fontColor: Colors.grey,
            verticalPadding: 0,
          ),
          SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 42),
            child: Column(
              children: [
                BigButtonWidget(
                  onPressed: onpressed,
                  label: 'Sign Up with Email ID',
                  backgroundColor: blueColor,
                  fontColor: white,
                ),
                BigButtonWidget(
                  onPressed: onpressed,
                  label: 'Sign Up with Google',
                  image: 'assets/google.png',
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account? ', style: TextStyle(fontSize: 18)),
              LinkButtonWidget(label: 'Sing In', onPressed: onpressed),
            ],
          ),
        ],
      ),
    );
  }
}
