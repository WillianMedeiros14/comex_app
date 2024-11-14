import 'package:comex_app/features/bottomNavigation/presentation/pages/BottomNavigationBar.dart';
import 'package:comex_app/features/home/presentation/pages/home_screen.dart';
import 'package:comex_app/features/home/presentation/pages/product_details.dart';
import 'package:comex_app/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:comex_app/shared/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  FlutterNativeSplash.remove();
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
        '/bottomNavigationScreenHome': (context) =>
            const BottomNavigationScreen(),
        '/home': (context) => const HomeScreen(),
        '/productDetails': (context) => const ProductDetails(),
      },
    );
  }
}
