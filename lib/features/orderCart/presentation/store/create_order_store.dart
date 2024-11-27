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
  Future<void> createOrder(OrderCreateModel orderCreate) async {
    isLoading = true;
    errorMessage = null;

    try {
      await orderRepository.createOrder(orderCreate: orderCreate);
      orderCreated = true;
    } on NotFoundException catch (e) {
      errorMessage = e.message;
    } catch (e) {
      errorMessage = "Ocorreu um erro ao criar o pedido.";
    } finally {
      isLoading = false;
    }
  }
}
