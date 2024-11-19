import 'package:comex_app/shared/data/model/order_model.dart';
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
          '/productDetails',
          arguments: {"productId": order.id},
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100,
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
                      SizedBox(
                        width: width,
                        child: const Text(
                          "teste",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        order.status,
                        style: const TextStyle(
                            color: Color(0xFF09AC53),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
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
                        '${order.creationDate}',
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