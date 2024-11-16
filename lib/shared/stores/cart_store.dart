import 'package:comex_app/shared/data/model/cart_order_item.dart';
import 'package:comex_app/shared/data/model/product_model.dart';
import 'package:comex_app/shared/data/model/cart_item.dart';
import 'package:mobx/mobx.dart';

part 'cart_store.g.dart';

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {
  @observable
  List<CartItem> listItem = ObservableList<CartItem>();

  @observable
  double totalPurchase = 0;

  @computed
  int get quantityItem => listItem.length;

  @computed
  bool get isEmptyList => listItem.isEmpty;

  @action
  void addCart(ProductModel item) {
    CartItem newItem = CartItem(
        product: item, order: CreateOrder(amount: 1, productId: item.id));
    listItem.add(newItem);
    updateTotalPurchase();
  }

  @action
  void removeCart(ProductModel item) {
    final CartItem cartItemToRemove =
        listItem.firstWhere((cartItem) => cartItem.product == item);

    listItem.remove(cartItemToRemove);
    updateTotalPurchase();
  }

  @action
  void updateTotalPurchase() {
    totalPurchase = 0.0;
    for (var i = 0; i < listItem.length; i++) {
      totalPurchase += listItem[i].totalPrice;
    }
    totalPurchase = double.parse(totalPurchase.toStringAsFixed(2));
  }

  @action
  void updateListItems(CartItem item) {
    for (var i = 0; i < listItem.length; i++) {
      if (listItem[i].product.id == item.product.id) {
        listItem.replaceRange(i, i + 1, [item]);
      }
    }
  }

  @action
  void increaseAmount(ProductModel item) {
    final CartItem cartItem =
        listItem.firstWhere((cartItem) => cartItem.product == item);

    cartItem.order.amount += 1;
    updateListItems(cartItem);
    updateTotalPurchase();
  }

  @action
  void decreaseAmount(ProductModel item) {
    final CartItem cartItem =
        listItem.firstWhere((cartItem) => cartItem.product == item);

    if (cartItem.order.amount > 1) {
      cartItem.order.amount -= 1;
      updateTotalPurchase();
      updateListItems(cartItem);
    } else {
      listItem.remove(cartItem);
      updateTotalPurchase();
    }
  }
}
