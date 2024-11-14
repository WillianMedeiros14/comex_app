import 'package:comex_app/features/home/presentation/widgets/Item_filter.dart';
import 'package:comex_app/features/home/presentation/widgets/item.dart';
import 'package:comex_app/features/home/presentation/widgets/search.dart';
import 'package:flutter/material.dart';

import '../widgets/filter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomScreenState();
}

class _HomScreenState extends State<HomeScreen> {
  final controllerSearchInput = TextEditingController();
  String filterActive = 'Todos';

  void _onFilterSelected(String filtro) {
    setState(() {
      filterActive = filtro;
    });

    print({filtro});
  }

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Search(
                            controllerSearchInput: controllerSearchInput),
                      ),
                      const SizedBox(width: 17),
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Filter(
                          filtterActive: filterActive,
                          onSelectFilter: _onFilterSelected,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ItemFilter(
                    text: filterActive,
                    isActive: true,
                  ),
                ],
              ),
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      Item(),
                      Item(),
                      Item(),
                      Item(),
                      Item(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
