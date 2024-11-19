import 'package:comex_app/features/orderHistory/presentation/widgets/order_status_widget.dart';
import 'package:comex_app/shared/data/model/order_model.dart';
import 'package:comex_app/shared/utils/date_format.dart';
import 'package:comex_app/shared/utils/first_three_names.dart';
import 'package:comex_app/shared/utils/number_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class OrderItemHistory extends StatelessWidget {
  final OrderModel order;

  const OrderItemHistory({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    late double width = (MediaQuery.of(context).size.width / 2) - 24;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding:
              const EdgeInsets.only(left: 16, bottom: 5, right: 16, top: 5)),
      onPressed: () {
        Navigator.pushNamed(
          context,
          '/orderHistoryDetailsScreen',
          // arguments: {"productId": order.id},
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 95,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(order.orderItems[0].imageProduct),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: width * 0.92,
                        child: Text(
                          firstThreeNamesOrderItems(order.orderItems),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      OrderStatusWidget(
                        status: order.status,
                      )
                      // Text(
                      //   order.status,
                      //   style: const TextStyle(
                      //       color: Color(0xFF09AC53),
                      //       fontSize: 12,
                      //       fontWeight: FontWeight.w500),
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Observer(builder: (_) {
                        return Text(
                          formatPriceToTwoDecimalPlaces(order.total),
                          style: const TextStyle(
                            color: Color(0xFFA72117),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      }),
                      Text(
                        formatDateTime(order.creationDate),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      )
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
