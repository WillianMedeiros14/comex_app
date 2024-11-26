import 'package:comex_app/shared/data/model/order_item_model.dart';
import 'package:comex_app/shared/data/model/order_model.dart';
import 'package:comex_app/shared/data/repositories/i_order_repository.dart';
import 'package:comex_app/shared/errors/exceptions.dart';
import 'package:mobx/mobx.dart';

part 'order_details_by_id_store.g.dart';

class OrderDetailsByIdStore = _OrderDetailsByIdStore
    with _$OrderDetailsByIdStore;

abstract class _OrderDetailsByIdStore with Store {
  final IOrderRepository repository;

  _OrderDetailsByIdStore({required this.repository});

  @observable
  bool isLoading = false;

  @observable
  OrderModel? state;

  @observable
  List<OrderItemModel> orderItems = ObservableList<OrderItemModel>();

  @computed
  int get totalItems =>
      orderItems.fold(0, (total, item) => total + item.amount);

  @observable
  String error = '';

  @action
  Future<void> getOrderById({required int orderId}) async {
    isLoading = true;
    error = '';

    try {
      final result = await repository.getOrderById(orderId: orderId);

      orderItems = result.orderItems;

      state = result;
    } on NotFoundException catch (e) {
      print("rro");
      print(e);
      error = e.message;
    } catch (e) {
      print("rro");
      print(e);
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }
}
