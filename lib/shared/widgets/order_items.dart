import 'package:comex_app/shared/data/model/cart_item.dart';
import 'package:comex_app/shared/stores/cart_store.dart';
import 'package:flutter/material.dart';
import 'package:comex_app/shared/widgets/add_and_decrease_product_quantity.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class OrderItems extends StatelessWidget {
  final bool isHistoric;
  final CartItem carItem;

  const OrderItems({super.key, this.isHistoric = false, required this.carItem});

  @override
  Widget build(BuildContext context) {
    final CartStore cartStore = Provider.of<CartStore>(context, listen: false);

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
        Navigator.pushNamed(context, '/productDetails');
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
                image: NetworkImage(
                  carItem.product.image,
                ),
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
                        child: Text(
                          carItem.product.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (isHistoric == true)
                        const Text(
                          'Concluído',
                          style: TextStyle(
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
                          "R\$ ${carItem.totalPrice}",
                          style: const TextStyle(
                            color: Color(0xFFA72117),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      }),
                      if (isHistoric)
                        const Text(
                          '14/11/2024 as 11:18 hs',
                          style: TextStyle(
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
          if (!isHistoric)
            Container(
              color: Colors.transparent,
              child: AddAndDecreaseProductQuantity(
                direction: Axis.vertical,
                value: carItem.order.amount,
                onDecrease: () => cartStore.decreaseAmount(carItem.product),
                onIncrease: () => cartStore.increaseAmount(carItem.product),
              ),
            ),
        ],
      ),
    );
  }
}
