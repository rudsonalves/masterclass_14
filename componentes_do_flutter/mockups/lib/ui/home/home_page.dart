import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mockups/ui/home/widgets/home_page_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _goToTinderPage() {
    Navigator.pushNamed(context, '/tinder');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: FlutterLogo(size: 200),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  children: [
                    Text(
                      'Get your Money Under Control',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Manage your expenses. Seamlessly.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 25),
              HomePageButton(
                onPressed: _goToTinderPage,
                label: 'Sign Up with Email ID',
                backgroundColor: Colors.indigoAccent,
                fontColor: Colors.white,
              ),
              HomePageButton(
                onPressed: _goToTinderPage,
                label: 'Sign Up with Google',
                imagePath: 'assets/images/Google.png',
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer:
                            TapGestureRecognizer()..onTap = _goToTinderPage,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
