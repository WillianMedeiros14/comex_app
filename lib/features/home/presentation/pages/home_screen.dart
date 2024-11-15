import 'package:comex_app/features/home/presentation/stores/product_store.dart';
import 'package:comex_app/features/home/presentation/widgets/filter.dart';
import 'package:comex_app/features/home/presentation/widgets/item_filter.dart';
import 'package:comex_app/features/home/presentation/widgets/item.dart';
import 'package:comex_app/features/home/presentation/widgets/search.dart';
import 'package:comex_app/shared/data/http/http_client.dart';
import 'package:comex_app/shared/data/repositories/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomScreenState();
}

class _HomScreenState extends State<HomeScreen> {
  final controllerSearchInput = TextEditingController();
  String filterActive = 'Todos';

  final ProductStore productStore = ProductStore(
    repository: ProductRepository(
      client: HttpClient(),
    ),
  );

  @override
  void initState() {
    super.initState();

    productStore.getProducts();
  }

  void _onFilterSelected(String filter) {
    setState(() {
      filterActive = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: RefreshIndicator(
        onRefresh: () => productStore.getProducts(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        ),
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
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 120),
                    child: Observer(
                      builder: (_) {
                        if (productStore.isLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        final filteredProducts =
                            productStore.state.where((product) {
                          if (filterActive == 'Todos') {
                            return true;
                          }

                          return product.category!.name == filterActive;
                        }).toList();

                        if (filteredProducts.isEmpty) {
                          return const Center(
                              child: Text('Nenhum produto encontrado.'));
                        }

                        return Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: filteredProducts.map((product) {
                            return Item(
                              product: product,
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
