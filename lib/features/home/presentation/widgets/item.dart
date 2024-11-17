// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:comex_app/shared/stores/cart_store.dart';
import 'package:flutter/material.dart';

import 'package:comex_app/shared/data/model/product_model.dart';
import 'package:provider/provider.dart';

class Item extends StatelessWidget {
  final ProductModel product;
  const Item({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    late double width = (MediaQuery.of(context).size.width / 2) - 24;
    final CartStore cartStore = Provider.of<CartStore>(context, listen: false);

    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding:
              const EdgeInsets.only(top: 24, bottom: 11, left: 16, right: 16),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/productDetails');
        },
        child: Column(
          children: [
            Container(
              width: width,
              height: width * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(
                    product.image,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Text(
                    product.name,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 15.9,
                        fontWeight: FontWeight.w600),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text("${product.category?.name}",
                    style: const TextStyle(
                        color: Color.fromARGB(92, 46, 44, 1),
                        fontSize: 13.3,
                        fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("R\$ ${product.price}",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16.2,
                            fontWeight: FontWeight.w600)),
                    IconButton(
                        onPressed: () {
                          cartStore.addCart(product);
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 35,
                        )),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
