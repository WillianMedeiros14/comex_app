import 'package:comex_app/features/home/presentation/widgets/Itens_filter.dart';
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
                  ItensFilter(
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
                      Items(),
                      Items(),
                      Items(),
                      Items(),
                      Items(),
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

class Items extends StatelessWidget {
  const Items({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    late double width = (MediaQuery.of(context).size.width / 2) - 24;

    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding:
              const EdgeInsets.only(top: 24, bottom: 11, left: 16, right: 16),
        ),
        onPressed: () {},
        child: Column(
          children: [
            Container(
              width: width,
              height: width * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://www.cnnbrasil.com.br/viagemegastronomia/wp-content/uploads/sites/5/2022/05/origem-do-hambuguer-cnn4.jpg?w=1200&h=900&crop=1',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Text(
                    "Hamburger",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 15.9,
                        fontWeight: FontWeight.w600),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text("Burger",
                    style: TextStyle(
                        color: Color.fromARGB(92, 46, 44, 1),
                        fontSize: 13.3,
                        fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('R 5,00',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16.2,
                            fontWeight: FontWeight.w600)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          size: 35,
                        )),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
