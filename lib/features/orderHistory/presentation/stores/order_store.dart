import 'package:comex_app/shared/data/model/order_model.dart';
import 'package:comex_app/shared/data/repositories/i_order_repository.dart';
import 'package:comex_app/shared/errors/exceptions.dart';
import 'package:mobx/mobx.dart';

part 'order_store.g.dart';

class OrderStore = _OrderStore with _$OrderStore;

abstract class _OrderStore with Store {
  final IOrderRepository repository;

  _OrderStore({required this.repository});

  @observable
  bool isLoading = false;

  @observable
  List<OrderModel> state = ObservableList<OrderModel>();

  @observable
  String error = '';

  @action
  Future<void> getOrders() async {
    isLoading = true;
    error = '';

    try {
      final result = await repository.getOrders();

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
