import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomScreenState();
}

class _HomScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: Column(
          children: [
             Padding(
              padding: EdgeInsets.only(left: 16, top: 14, right: 16, bottom:14),
               child: SizedBox(
                width: 73,
                height: 73,
                child: Positioned.fill(
                  child: Image.asset(
                    "assets/images/background_onboarding2.png",
                    fit: BoxFit.cover,
                  ),
                ),
                           ),
             ),
          ],
        ),
      ),
    );
  }
}