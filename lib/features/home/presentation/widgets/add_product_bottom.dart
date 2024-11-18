import 'package:comex_app/features/home/presentation/stores/item_product_store.dart';
import 'package:comex_app/shared/data/model/product_model.dart';
import 'package:comex_app/shared/stores/cart_store.dart';
import 'package:comex_app/shared/widgets/add_and_decrease_product_quantity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AddProductBottom extends StatelessWidget {
  final ProductModel product;
  const AddProductBottom({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final CartStore cartStore = Provider.of<CartStore>(context, listen: false);
    final itemProductStore = ItemProductStore(cartStore, product.id);
    print({cartStore});
    return Positioned(
      bottom: 16,
      left: 16,
      right: 16,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),
        child: Observer(
          builder: (_) => Row(
            children: <Widget>[
              if (itemProductStore.totalItems > 0)
                AddAndDecreaseProductQuantity(
                  direction: Axis.horizontal,
                  value: itemProductStore.totalItems,
                  onDecrease: () => cartStore.decreaseAmount(product),
                  onIncrease: () => cartStore.increaseAmount(product),
                ),
              if (itemProductStore.totalItems == 0)
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      cartStore.addCart(product);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(3, 87, 48, 1),
                    ),
                    child: const Text(
                      'Adicionar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
