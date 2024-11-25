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
  bool isNotEmpiy = true;

  @observable
  String error = '';

  @action
  Future<void> getOrderById({required int orderId}) async {
    isLoading = true;
    error = '';
    isNotEmpiy = true;

    try {
      final result = await repository.getOrderById(orderId: orderId);

      print("Pedido");
      print(result.total);

      state = result;
      isNotEmpiy = false;
    } on NotFoundException catch (e) {
      print("rro");
      print(e);
      error = e.message;
      isNotEmpiy = true;
    } catch (e) {
      print("rro");
      print(e);
      error = e.toString();
      isNotEmpiy = true;
    } finally {
      isLoading = false;
    }
  }
}
