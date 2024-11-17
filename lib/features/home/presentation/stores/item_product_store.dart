import 'package:comex_app/shared/data/model/cart_item.dart';
import 'package:comex_app/shared/data/model/cart_order_item.dart';
import 'package:comex_app/shared/stores/cart_store.dart';
import 'package:mobx/mobx.dart';

part 'item_product_store.g.dart';

class ItemProductStore = _ItemProductStore with _$ItemProductStore;

abstract class _ItemProductStore with Store {
  final CartStore cartStore;
  final int id;

  _ItemProductStore(this.cartStore, this.id);

  int get totalItems {
    try {
      return cartStore.listItem
          .where((item) => item.product.id == id)
          .map((item) => item.order.amount)
          .first;
    } catch (e) {
      return 0;
    }
  }
}
