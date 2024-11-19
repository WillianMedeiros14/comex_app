import 'package:comex_app/features/orderHistory/presentation/utils/format_color_status.dart';
import 'package:comex_app/shared/enums/order_status_enum.dart';
import 'package:flutter/material.dart';

class OrderStatusWidget extends StatelessWidget {
  final OrderStatusEnum status;
  const OrderStatusWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    String statusText =
        status.name[0].toUpperCase() + status.name.substring(1).toLowerCase();

    return Text(
      statusText,
      style: TextStyle(
          color: getStatusColor(status),
          fontSize: 12,
          fontWeight: FontWeight.w500),
    );
  }
}
