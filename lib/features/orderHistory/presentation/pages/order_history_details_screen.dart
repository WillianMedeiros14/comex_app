import 'package:comex_app/features/orderHistory/presentation/stores/order_store.dart';
import 'package:comex_app/features/orderHistory/presentation/widgets/order_item_history.dart';
import 'package:comex_app/shared/data/http/http_client.dart';
import 'package:comex_app/shared/data/repositories/order_repository.dart';
import 'package:comex_app/shared/widgets/order_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class OrderHistoryDetailsScreen extends StatefulWidget {
  const OrderHistoryDetailsScreen({super.key});

  @override
  State<OrderHistoryDetailsScreen> createState() =>
      _OrderHistoryDetailsScreenState();
}

class _OrderHistoryDetailsScreenState extends State<OrderHistoryDetailsScreen> {
  final OrderStore orderStore = OrderStore(
    repository: OrderRepository(
      client: HttpClient(),
    ),
  );

  @override
  void initState() {
    super.initState();

    orderStore.getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            "Detalhes do pedido",
            style: TextStyle(
                fontSize: 22,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          automaticallyImplyLeading: true),
      body: Stack(children: [
        Observer(builder: (_) {
          return Expanded(
              child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              if (orderStore.state.isEmpty)
                const Center(child: Text('Nenhum item no carrinho.')),
            ],
          ));
        }),
        Observer(builder: (_) {
          return Expanded(
            child: CustomScrollView(
              slivers: [
                // SliverPadding(
                //   padding: const EdgeInsets.all(16),
                //   sliver: SliverList(
                //     delegate: SliverChildBuilderDelegate(
                //       (context, index) {
                //         return OrderItems(
                //           carItem: orderStore.state[index],
                //         );
                //       },
                //       childCount: cartStore.listItem.length,
                //     ),
                //   ),
                // ),
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
          bottom: 16,
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
                    // Observer(builder: (_) {
                    //   return Text(
                    //     formatPriceToTwoDecimalPlaces(cartStore.totalPurchase),
                    //     style: const TextStyle(
                    //       color: Color(0xFFA72117),
                    //       fontSize: 25.5,
                    //       fontWeight: FontWeight.w600,
                    //     ),
                    //   );
                    // }),
                  ],
                ),
                const SizedBox(
                  height: 31,
                ),
                // Observer(builder: (_) {
                //   return ElevatedButton(
                //     onPressed: cartStore.isEmptyList ? null : () {},
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: const Color.fromRGBO(3, 87, 48, 1),
                //     ),
                //     child: const Text(
                //       'Fechar pedido',
                //       style: TextStyle(color: Colors.white),
                //     ),
                //   );
                // }),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
