import 'package:comex_app/shared/enums/order_status_enum.dart';

class OrderCreateModel {
  final OrderStatusEnum status;
  final DateTime creationDate;
  final List<OrderItemCreateModel> orderItems;

  OrderCreateModel({
    required this.status,
    required this.creationDate,
    required this.orderItems,
  });

  Map<String, dynamic> toJson() {
    return {
      'status': "Pendente",
      'creationDate': creationDate.toIso8601String(),
      'orderItems': orderItems.map((item) => item.toJson()).toList(),
    };
  }
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
