import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          // Imagem de fundo, preenche a tela
          Image.asset(
            "assets/images/background_onboarding2.png",
            width: double.infinity,
            height: screenHeight * 0.8, // Ajuste a altura conforme necessário
            fit: BoxFit.cover, // Faz a imagem cobrir a área disponível
          ),
          // Conteúdo principal
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
                        context, '/BottomNavigationScreenHome'),
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
