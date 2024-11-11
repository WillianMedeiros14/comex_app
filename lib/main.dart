import 'package:comex_app/features/onboarding/onboarding_screen.dart';
import 'package:comex_app/shared/themes/theme.dart';
import 'package:flutter/material.dart';

void main() {
 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme,
      home: const OnboardingScreen(),
      
    );
  }
}

