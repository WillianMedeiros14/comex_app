import 'package:comex_app/shared/data/model/cart_item.dart';
import 'package:comex_app/shared/enums/order_status_enum.dart';

class OrderCreateModel {
  final String status;
  final String creationDate;
  final List<OrderItemCreateModel> orderItems;

  OrderCreateModel({
    required this.status,
    required this.creationDate,
    required this.orderItems,
  });

  Map<String, dynamic> toJson() {
    return {
      'status': "Pendente",
      'creationDate': creationDate,
      'orderItems': orderItems.map((item) => item.toJson()).toList(),
    };
  }
}

mapCartItemsToOrderCreateModel({
  required List<CartItem> cartItems,
}) {
  List<OrderItemCreateModel> orderItems = cartItems.map((cartItem) {
    return OrderItemCreateModel(
      productId: cartItem.product.id,
      amount: cartItem.order.amount,
    );
  }).toList();

  OrderStatusEnum status = OrderStatusEnum.pendente;
  String formattedDate = DateTime.now().toUtc().toIso8601String();
  return OrderCreateModel(
    status: status.capitalized,
    orderItems: orderItems,
    creationDate: formattedDate,
  );
}

class OrderItemCreateModel {
  final int productId;
  final int amount;

  OrderItemCreateModel({
    required this.productId,
    required this.amount,
  });

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'amount': amount,
    };
  }
}
