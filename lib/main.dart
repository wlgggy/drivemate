import 'package:drivemate/ui/splash_screen.dart';
import 'package:drivemate/ui/view/start/insert_view.dart';
import 'package:drivemate/ui/view/start/load_view.dart';
import 'package:drivemate/ui/view/start/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static const Color logo = const Color(0xFFB4877A);
  static const Color point = const Color(0xFFBF011D);
  static const Color background = const Color(0xFF000000);
  static const Color darkGrey = const Color(0xFF141414);
  static const Color grey = const Color(0xFF7D7D7D);
  static const Color fontGrey = const Color(0xFF9E9E9E);
  static const Color insertGrey = const Color(0xFFE6E6E6);
  static const Color widgetGrey = const Color(0xFFF0F0F0);
  static const Color white = const Color(0xFFFAFAFA);

  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      home: SplashScreen(),
    );
  }
}
