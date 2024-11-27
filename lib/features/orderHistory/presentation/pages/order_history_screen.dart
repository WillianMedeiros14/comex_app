import 'package:comex_app/features/orderHistory/presentation/stores/order_store.dart';
import 'package:comex_app/features/orderHistory/presentation/widgets/order_item_history.dart';
import 'package:comex_app/shared/data/http/http_client.dart';
import 'package:comex_app/shared/data/repositories/order_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
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
          "Histórico de pedidos",
          style: TextStyle(
              fontSize: 22,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Stack(children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 120),
                    child: Observer(
                      builder: (_) {
                        if (orderStore.isLoading) {
                          return Center(
                            child: Container(
                              padding: const EdgeInsets.only(top: 100),
                              child: const CircularProgressIndicator(),
                            ),
                          );
                        }

                        if (orderStore.state.isEmpty) {
                          return Center(
                            child: Container(
                              padding: EdgeInsets.only(top: 100),
                              child: Text('Nenhum pedido encontrado.'),
                            ),
                          );
                        }

                        return Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: orderStore.state.map((order) {
                            return OrderItemHistory(
                              order: order,
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
        ]),
      ),
    );
  }
}
