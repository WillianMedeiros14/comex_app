import 'package:comex_app/features/bottomNavigation/widget/BottomNavigationBar.dart';
import 'package:comex_app/features/home/home_screen.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingScreen(),
        '/BottomNavigationScreenHome': (context) => const BottomNavigationScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
