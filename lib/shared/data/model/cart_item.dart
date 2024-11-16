import 'package:comex_app/shared/data/model/cart_order_item.dart';
import 'package:comex_app/shared/data/model/product_model.dart';

class CartItem {
  final ProductModel product;
  final CreateOrder order;

  CartItem({required this.product, required this.order});

  double get totalPrice {
    return product.price * order.amount;
  }
}
