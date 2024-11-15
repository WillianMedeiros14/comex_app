import 'package:comex_app/shared/data/model/product_model.dart';
import 'package:comex_app/shared/data/repositories/i_product_repository.dart';
import 'package:comex_app/shared/errors/exceptions.dart';
import 'package:mobx/mobx.dart';

part 'product_store.g.dart';

class ProductStore = _ProductStore with _$ProductStore;

abstract class _ProductStore with Store {
  final IProductRepository repository;

  _ProductStore({required this.repository});

  @observable
  bool isLoading = false;

  @observable
  List<ProductModel> state = ObservableList<ProductModel>();

  @observable
  String error = '';

  @action
  Future<void> getProducts() async {
    isLoading = true;
    error = '';

    try {
      final result = await repository.getProducts();
      print({result});
      state = result;
    } on NotFoundException catch (e) {
      error = e.message;
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }
}
