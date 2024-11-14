import 'package:comex_app/features/home/presentation/widgets/draggable_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/Add_product_bottom.dart';
import '../widgets/product_details_screen_header.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 0.8,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://fly.metroimg.com/upload/q_85,w_700/https://uploads.metroimg.com/wp-content/uploads/2022/05/03124339/hamburguer-8.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Hamburger",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 26.7,
                                  fontWeight: FontWeight.w600),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Text(
                              "R\$ 5,00",
                              style: TextStyle(
                                color: Color(0xFFA72117),
                                fontSize: 25.5,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Burger",
                          style: TextStyle(
                            color: Color.fromARGB(221, 27, 27, 21),
                            fontSize: 14.9,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 25),
                        const Text(
                          "Informações:",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Pão macio com ou sem sementes de gergelim\n"
                          "Carne bovina grelhada e suculenta\n"
                          "Fatia de queijo derretido\n"
                          "Folhas frescas de alface\n"
                          "Fatias de tomate\n"
                          "Cebola\n"
                          "Picles crocantes\n"
                          "Condimentos:\n"
                          "- Maionese\n"
                          "- Ketchup\n"
                          "- Mostarda\n"
                          "Acompanhamento opcional:\n"
                          "- Batatas fritas\n"
                          "- Bebida gelada",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.9,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
          const ProductDetailsScreenHeader(),
          const AddProductBottom(),
          const DraggableWidget()
        ],
      ),
    );
  }
}
