import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomScreenState();
}

class _HomScreenState extends State<HomeScreen> {
  final controllerSearchInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, top: 14, right: 16, bottom: 14),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 73,
                  height: 73,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/background_onboarding2.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, bottom: 16, right: 16, top: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                        fontSize: 26,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: "Escolha seus ",
                        ),
                        TextSpan(
                          text: "items",
                          style: TextStyle(color: Colors.red),
                        ),
                        TextSpan(
                          text: " e realize seu pedido",
                        ),
                      ],
                    ),
                    softWrap: true,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controllerSearchInput,
                      style: const TextStyle(fontSize: 14.8),
                      decoration: InputDecoration(
                        hintText: "Pesquisar",
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide:
                              const BorderSide(width: 0.5, color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide:
                              const BorderSide(width: 1.5, color: Colors.black),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 17),
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.filter_list),
                      color: Colors.white,
                      onPressed: () {
                        print('IconButton pressed');
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
