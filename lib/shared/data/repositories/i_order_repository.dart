import 'package:comex_app/features/orderCart/data/Model/create_order_model.dart';
import 'package:comex_app/shared/data/model/order_model.dart';

abstract class IOrderRepository {
  Future<List<OrderModel>> getOrders();
  Future<OrderModel> getOrderById({required int orderId});
  Future<OrderModel> createOrder({required OrderCreateModel orderCreate});
}
