import 'package:comex_app/shared/enums/order_status_enum.dart';
import 'package:comex_app/shared/data/model/order_item_model.dart';

class OrderModel {
  final int id;
  final DateTime creationDate;
  final OrderStatusEnum status;
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
      status: _statusFromString(map['status']),
      total: map['total'].toDouble(),
      orderItems: (map['orderItems'] as List<dynamic>)
          .map((item) => OrderItemModel.fromMap(item))
          .toList(),
    );
  }

  static OrderStatusEnum _statusFromString(String status) {
    switch (status) {
      case 'Pendente':
        return OrderStatusEnum.pendente;
      case 'Processando':
        return OrderStatusEnum.processando;
      case 'Concluido':
        return OrderStatusEnum.concluido;
      case 'Cancelado':
        return OrderStatusEnum.cancelado;
      default:
        throw Exception('Status inválido: $status');
    }
  }

  String statusToString() {
    return status.toString().split('.').last;
  }
}
