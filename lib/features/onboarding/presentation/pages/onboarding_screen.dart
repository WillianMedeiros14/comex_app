import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/background_onboarding2.png",
            width: double.infinity,
            height: screenHeight * 0.8,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(57),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Realize seus pedidos",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                      fontSize: 25),
                ),
                const SizedBox(height: 11),
                const Text(
                  "Explore, peça e aproveite uma experiência de compra rápida e personalizada. Qualidade garantida!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white70,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.normal,
                      fontSize: 12.8),
                ),
                const SizedBox(height: 26),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(
                        context, '/bottomNavigationScreenHome'),
                    child: const Text('Começar'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
