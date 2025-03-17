import 'package:flutter/material.dart';
import 'package:mockups/ui/home/home_page.dart';
import 'package:mockups/ui/tinder/tinder.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/': (_) => HomePage(), '/tinder': (_) => TinderPage()},
    );
  }
}
