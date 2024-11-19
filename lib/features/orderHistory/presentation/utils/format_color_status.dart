import 'package:flutter/material.dart';
import 'package:comex_app/shared/enums/order_status_enum.dart';

Color getStatusColor(OrderStatusEnum status) {
  switch (status) {
    case OrderStatusEnum.pendente:
      return Colors.orange;
    case OrderStatusEnum.processando:
      return Colors.blue;
    case OrderStatusEnum.concluido:
      return Colors.green;
    case OrderStatusEnum.cancelado:
      return Colors.red;
    default:
      return Colors.grey;
  }
}
