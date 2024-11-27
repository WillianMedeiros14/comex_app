import 'package:comex_app/shared/data/model/cart_item.dart';
import 'package:mobx/mobx.dart';
import 'package:comex_app/features/orderCart/data/Model/create_order_model.dart';
import 'package:comex_app/shared/data/model/order_model.dart';
import 'package:comex_app/shared/data/repositories/i_order_repository.dart';
import 'package:comex_app/shared/errors/exceptions.dart';

part 'create_order_store.g.dart';

class CreateOrderStore = _CreateOrderStoreBase with _$CreateOrderStore;

abstract class _CreateOrderStoreBase with Store {
  final IOrderRepository orderRepository;

  _CreateOrderStoreBase({required this.orderRepository});

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  bool orderCreated = false;

  @action
  Future<bool> createOrder({
    required List<CartItem> cartItems,
  }) async {
    isLoading = true;
    errorMessage = null;
    orderCreated = false;

    final orderToSend = converteDataToSend(cartItems: cartItems);

    try {
      final result =
          await orderRepository.createOrder(orderCreate: orderToSend);
      if (result) {
        orderCreated = true;
        return true;
      } else {
        orderCreated = false;
        return false;
      }
    } on NotFoundException catch (e) {
      errorMessage = e.message;
      return false;
    } catch (e) {
      errorMessage = "Ocorreu um erro ao criar o pedido.";
      return false;
    } finally {
      isLoading = false;
    }
  }

  OrderCreateModel converteDataToSend({
    required List<CartItem> cartItems,
  }) {
    OrderCreateModel orderCreateModel =
        mapCartItemsToOrderCreateModel(cartItems: cartItems);

    return orderCreateModel;
  }
}
