import 'package:comex_app/features/orderCart/data/Model/create_order_model.dart';
import 'package:comex_app/features/orderCart/presentation/store/create_order_store.dart';
import 'package:comex_app/shared/data/http/http_client.dart';
import 'package:comex_app/shared/data/repositories/order_repository.dart';
import 'package:comex_app/shared/stores/cart_store.dart';
import 'package:comex_app/shared/utils/number_format.dart';
import 'package:comex_app/shared/widgets/order_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:comex_app/features/orderCart/presentation/widgets/modal_success_order.dart';

class OrderCartScreen extends StatefulWidget {
  final bool isActiveBottom;
  const OrderCartScreen({super.key, this.isActiveBottom = true});

  @override
  State<OrderCartScreen> createState() => _OrderCartScreenState();
}

class _OrderCartScreenState extends State<OrderCartScreen> {
  late bool isActiveBottom;

  final CreateOrderStore createOrderStore = CreateOrderStore(
    orderRepository: OrderRepository(
      client: HttpClient(),
    ),
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, bool>?;

    if (args != null && args.containsKey('isActiveBottom')) {
      isActiveBottom = args['isActiveBottom'] as bool;
    } else {
      isActiveBottom = widget.isActiveBottom;
    }
  }

  @override
  Widget build(BuildContext context) {
    final CartStore cartStore = Provider.of<CartStore>(context, listen: false);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "Carriho de compras",
          style: TextStyle(
              fontSize: 22,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        automaticallyImplyLeading: !isActiveBottom,
      ),
      body: Stack(
        children: [
          Observer(builder: (_) {
            return Expanded(
                child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                if (cartStore.isEmptyList)
                  const Center(child: Text('Nenhum item no carrinho.')),
              ],
            ));
          }),
          Observer(builder: (_) {
            return Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return OrderItems(
                            carItem: cartStore.listItem[index],
                          );
                        },
                        childCount: cartStore.listItem.length,
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 250,
                    ),
                  ),
                ],
              ),
            );
          }),
          Positioned(
            bottom: !isActiveBottom ? 16 : 100,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Preço total",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Observer(builder: (_) {
                        return Text(
                          formatPriceToTwoDecimalPlaces(
                              cartStore.totalPurchase),
                          style: const TextStyle(
                            color: Color(0xFFA72117),
                            fontSize: 25.5,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      }),
                    ],
                  ),
                  const SizedBox(
                    height: 31,
                  ),
                  Observer(builder: (_) {
                    return ElevatedButton(
                        onPressed: cartStore.isEmptyList
                            ? null
                            : () async {
                                final result = await createOrderStore
                                    .createOrder(cartItems: cartStore.listItem);

                                if (result) {
                                  cartStore.clearCart();
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(3, 87, 48, 1),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            createOrderStore.isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    'Fechar pedido',
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ],
                        ));
                  }),
                ],
              ),
            ),
          ),
          Observer(builder: (_) {
            return ModalSuccessOrder(
              isOpen: createOrderStore.orderCreated,
            );
          })
        ],
      ),
    );
  }
}
