import 'package:comex_app/features/orderHistory/presentation/stores/order_details_by_id_store.dart';
import 'package:comex_app/features/orderHistory/presentation/widgets/order_item_details.widget.dart';
import 'package:comex_app/features/orderHistory/presentation/widgets/order_status_widget.dart';
import 'package:comex_app/shared/data/http/http_client.dart';
import 'package:comex_app/shared/data/repositories/order_repository.dart';
import 'package:comex_app/shared/utils/date_format.dart';
import 'package:comex_app/shared/utils/number_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    repository: OrderRepository(client: HttpClient()),
  );

  late int orderId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, int>?;

    if (args != null && args.containsKey('orderId')) {
      orderId = args['orderId']!;
      orderStoreDetails.getOrderById(orderId: orderId);
    } else if (widget.orderId != null) {
      orderId = widget.orderId!;
      orderStoreDetails.getOrderById(orderId: orderId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Observer(builder: (_) {
          return Text(
            "Detalhes do pedido",
            style: TextStyle(
              fontSize: 22,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
            ),
          );
        }),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 120),
                    child: Observer(
                      builder: (_) {
                        if (orderStoreDetails.isLoading) {
                          return Center(
                            child: Container(
                                padding: EdgeInsets.only(top: 100),
                                child: CircularProgressIndicator()),
                          );
                        }

                        if (orderStoreDetails.orderItems.isEmpty) {
                          return Center(
                            child: Container(
                                padding: EdgeInsets.only(top: 100),
                                child: Text('Nenhum pedido encontrado.')),
                          );
                        }
                        return Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: orderStoreDetails.orderItems.map((order) {
                            return OrderItemDetailsWidget(
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
                        "Status",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Observer(
                        builder: (_) {
                          if (orderStoreDetails.state != null) {
                            return OrderStatusWidget(
                              status: orderStoreDetails.state!.status,
                              fontSize: 16,
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Data do pedido",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Observer(
                        builder: (_) {
                          if (orderStoreDetails.state != null) {
                            return Text(
                              formatDateTime(
                                  orderStoreDetails.state!.creationDate),
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Todal de itens",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Observer(
                        builder: (_) {
                          if (orderStoreDetails.state != null) {
                            return Text(
                              '${orderStoreDetails.totalItems}',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16,
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
                          if (orderStoreDetails.state != null) {
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
