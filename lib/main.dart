import 'package:flutter/material.dart';
import 'package:timer_app/src/config/config.dart';
import 'package:timer_app/src/core/presentation/app_home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme,
      home: const AppHome(),
    );
  }
}
