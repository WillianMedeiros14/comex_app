import 'package:comex_app/shared/data/model/order_item_model.dart';

class OrderModel {
  final int id;
  final DateTime creationDate;
  final String status;
  final double total;
  final List<OrderItemModel> orderItems;

  OrderModel({
    required this.id,
    required this.creationDate,
    required this.status,
    required this.total,
    required this.orderItems,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'],
      creationDate: DateTime.parse(map['creationDate']),
      status: map['status'],
      total: map['total'].toDouble(),
      orderItems: (map['orderItems'] as List<dynamic>)
          .map((item) => OrderItemModel.fromMap(item))
          .toList(),
    );
  }
}
