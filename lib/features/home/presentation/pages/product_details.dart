import 'package:comex_app/features/home/presentation/stores/item_product_store.dart';
import 'package:comex_app/features/home/presentation/stores/product_details_store.dart';
import 'package:comex_app/features/home/presentation/widgets/draggable_widget.dart';
import 'package:comex_app/shared/data/http/http_client.dart';
import 'package:comex_app/shared/data/repositories/product_repository.dart';
import 'package:comex_app/shared/stores/cart_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../widgets/Add_product_bottom.dart';
import '../widgets/product_details_screen_header.dart';

class ProductDetails extends StatefulWidget {
  final int? productId;
  const ProductDetails({super.key, this.productId});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final ProductDetailsStore productDetailsStore = ProductDetailsStore(
    repository: ProductRepository(
      client: HttpClient(),
    ),
  );

  late int productId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, int>?;

    if (args != null && args.containsKey('productId')) {
      productId = args['productId'] as int;
      productDetailsStore.getProductById(productId: productId);
    } else {
      productId = widget.productId!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final CartStore cartStore = Provider.of<CartStore>(context, listen: false);
    final itemProductStore = ItemProductStore(cartStore, productId);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Observer(
        builder: (_) {
          return Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width * 0.8,
                        child: Observer(builder: (_) {
                          final imageUrl = productDetailsStore.state?.image ??
                              'https://archive.org/download/placeholder-image/placeholder-image.jpg';

                          return DecoratedBox(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Observer(builder: (_) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (productDetailsStore.isLoading)
                                const Center(
                                    child: CircularProgressIndicator()),
                              if (productDetailsStore.state == null &&
                                  !productDetailsStore.isLoading)
                                const Center(
                                    child: Text('Nenhum produto encontrado.')),
                              if (productDetailsStore.state != null)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.60,
                                      child: Text(
                                        productDetailsStore.state!.name,
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 26.7,
                                            fontWeight: FontWeight.w600),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                      "R\$ ${productDetailsStore.state!.price}",
                                      style: const TextStyle(
                                        color: Color(0xFFA72117),
                                        fontSize: 25.5,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              const SizedBox(height: 8),
                              if (productDetailsStore.state != null)
                                Text(
                                  productDetailsStore.state!.category!.name,
                                  style: const TextStyle(
                                    color: Color.fromARGB(221, 27, 27, 21),
                                    fontSize: 14.9,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              const SizedBox(height: 25),
                              Text(
                                "Informações:  ${itemProductStore.totalItems}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 5),
                              if (productDetailsStore.state != null)
                                Text(
                                  "${productDetailsStore.state!.description}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.9,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                            ],
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
              ),
              const ProductDetailsScreenHeader(),
              if (productDetailsStore.state != null)
                AddProductBottom(product: productDetailsStore.state!),
              if (productDetailsStore.state != null && cartStore.totalItems > 0)
                DraggableWidget(value: cartStore.totalItems),
            ],
          );
        },
      ),
    );
  }
}
