import 'dart:convert';

import 'package:comex_app/shared/data/http/http_client.dart';
import 'package:comex_app/shared/data/model/order_model.dart';
import 'package:comex_app/shared/data/repositories/i_order_repository.dart';
import 'package:comex_app/shared/errors/exceptions.dart';

class OrderRepository implements IOrderRepository {
  final IHttpClient client;

  OrderRepository({required this.client});

  @override
  Future<List<OrderModel>> getOrders() async {
    final response = await client.get(
      url: 'http://192.168.1.101:8082/api/Order',
    );

    if (response.statusCode == 200) {
      final List<OrderModel> orders = [];

      final body = jsonDecode(response.body);

      body.map((item) {
        final OrderModel product = OrderModel.fromMap(item);
        orders.add(product);
      }).toList();

      return orders;
    } else if (response.statusCode == 404) {
      throw NotFoundException('A url informada não é válida');
    } else {
      throw Exception('Não foi possível carregar os pedidos');
    }
  }

  @override
  Future<OrderModel> getOrderById({required int orderId}) async {
    final response = await client.get(
      url: 'http://192.168.1.101:8082/api/Order/$orderId',
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      final OrderModel order = OrderModel.fromMap(body);

      return order;
    } else if (response.statusCode == 404) {
      throw NotFoundException('A url informada não é válida');
    } else {
      throw Exception('Não foi possível carregar o pedido');
    }
  }
}
