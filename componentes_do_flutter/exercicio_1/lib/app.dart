import 'package:flutter/material.dart';
import 'package:responsividade/core/singletons/app_settings.dart';
import 'package:responsividade/core/theme/util.dart';
import 'package:responsividade/ui/home/home_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final app = AppSettings.instance;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_initialized) {
      _initialized = true;

      final brightness = View.of(context).platformDispatcher.platformBrightness;
      TextTheme textTheme = createTextTheme(context, "Lora", "Lora");

      app.init(brightness, textTheme);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: app.theme,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
