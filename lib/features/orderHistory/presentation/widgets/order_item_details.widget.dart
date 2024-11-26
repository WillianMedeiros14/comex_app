// import 'package:comex_app/features/orderHistory/presentation/widgets/order_status_widget.dart';
import 'package:comex_app/shared/data/model/order_item_model.dart';
// import 'package:comex_app/shared/data/model/order_model.dart';
// import 'package:comex_app/shared/utils/date_format.dart';
// import 'package:comex_app/shared/utils/first_three_names.dart';
import 'package:comex_app/shared/utils/number_format.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';

class OrderItemDetailsWidget extends StatelessWidget {
  final OrderItemModel order;

  const OrderItemDetailsWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
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
          arguments: {"productId": order.productId},
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
                image: NetworkImage(order.imageProduct),
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
                        width: MediaQuery.of(context).size.width * 0.54,
                        child: Text(
                          order.nameProduct,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formatPriceToTwoDecimalPlaces(order.total),
                        style: const TextStyle(
                          color: Color(0xFFA72117),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${order.amount}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
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
