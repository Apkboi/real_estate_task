import 'package:flutter/material.dart';
import 'package:real_estate_task/presentation/views/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Estate App',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: const OnboardingScreen(),
    );
  }
}
