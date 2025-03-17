import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const basicColor = Color(0xFF4D59FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Logo(basicColor: basicColor),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                MainText(label: 'Get you Money'),
                MainText(label: 'Under Control'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SecondText(label: 'Manager your expenses.'),
                SecondText(label: 'Seamlessly.'),
              ],
            ),
          ),
          SizedBox(height: 80),
          Container(
            width: double.infinity,
            height: 64,
            decoration: BoxDecoration(
              color: basicColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                'Sign Up with Email ID',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  // color: Colors.grey,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12),
            width: double.infinity,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Google.png',
                  width: 32,
                  fit: BoxFit.fitWidth,
                ),
                Text(
                  'Sign Up with Google',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 48),
            child: Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already heva an accont?', style: TextStyle(fontSize: 18)),
                Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key, required this.basicColor});

  final Color basicColor;

  @override
  Widget build(BuildContext context) {
    final size = 60.0;
    final spacing = size * .1;

    return Row(
      spacing: spacing,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          spacing: spacing,
          children: [
            Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                color: basicColor,
                borderRadius: BorderRadius.circular(size / 2),
              ),
            ),
            Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                color: basicColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(size),
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 2 * size + spacing,
          width: size,
          decoration: BoxDecoration(
            color: basicColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(size),
              bottomLeft: Radius.circular(size),
            ),
          ),
        ),
      ],
    );
  }
}

class SecondText extends StatelessWidget {
  final String label;
  const SecondText({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
    );
  }
}

class MainText extends StatelessWidget {
  final String label;

  const MainText({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
    );
  }
}
