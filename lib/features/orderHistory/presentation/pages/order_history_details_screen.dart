import 'package:comex_app/features/orderHistory/presentation/stores/order_details_by_id_store.dart';
import 'package:comex_app/features/orderHistory/presentation/stores/order_store.dart';
import 'package:comex_app/features/orderHistory/presentation/widgets/order_item_details.widget.dart';
import 'package:comex_app/features/orderHistory/presentation/widgets/order_item_history.dart';
import 'package:comex_app/shared/data/http/http_client.dart';
import 'package:comex_app/shared/data/repositories/order_repository.dart';
import 'package:comex_app/shared/utils/number_format.dart';
import 'package:comex_app/shared/widgets/order_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class OrderHistoryDetailsScreen extends StatefulWidget {
  final int? orderId;
  const OrderHistoryDetailsScreen({super.key, this.orderId});

  @override
  State<OrderHistoryDetailsScreen> createState() =>
      _OrderHistoryDetailsScreenState();
}

class _OrderHistoryDetailsScreenState extends State<OrderHistoryDetailsScreen> {
  final OrderDetailsByIdStore orderStoreDetails = OrderDetailsByIdStore(
    repository: OrderRepository(
      client: HttpClient(),
    ),
  );

  late int orderId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, int>?;

    if (args != null && args.containsKey('orderId')) {
      orderId = args['orderId'] as int;
      orderStoreDetails.getOrderById(orderId: orderId);
    } else {
      orderId = widget.orderId!;
    }
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
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Observer(builder: (_) {
              if (orderStoreDetails.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (orderStoreDetails.state == null) {
                return const Center(child: Text('Pedido não encontrado.'));
              }

              return Column(
                children: [
                  const SizedBox(height: 100),
                  if (orderStoreDetails.state?.orderItems != null)
                    CustomScrollView(
                      slivers: [
                        SliverPadding(
                          padding: const EdgeInsets.all(16),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                return Observer(builder: (_) {
                                  return OrderItemDetailsWidget(
                                    order: orderStoreDetails
                                        .state!.orderItems[index],
                                  );
                                });
                              },
                              childCount:
                                  orderStoreDetails.state!.orderItems.length,
                            ),
                          ),
                        ),
                        const SliverToBoxAdapter(
                          child: SizedBox(height: 250),
                        ),
                      ],
                    ),
                ],
              );
            }),
          ),
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
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Observer(
                        builder: (_) {
                          if (orderStoreDetails.state?.total != null) {
                            return Text(
                              formatPriceToTwoDecimalPlaces(
                                  orderStoreDetails.state!.total),
                              style: const TextStyle(
                                color: Color(0xFFA72117),
                                fontSize: 25.5,
                                fontWeight: FontWeight.w600,
                              ),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 31,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
