import 'package:comex_app/shared/data/model/product_model.dart';
import 'package:comex_app/shared/data/repositories/i_product_repository.dart';
import 'package:comex_app/shared/errors/exceptions.dart';
import 'package:mobx/mobx.dart';

part 'product_details_store.g.dart';

class ProductDetailsStore = _ProductDetailsStore with _$ProductDetailsStore;

abstract class _ProductDetailsStore with Store {
  final IProductRepository repository;

  _ProductDetailsStore({required this.repository});

  @observable
  bool isLoading = false;

  @observable
  ProductModel? state;

  @observable
  String error = '';

  @action
  Future<void> getProductById({required int productId}) async {
    isLoading = true;
    error = '';

    try {
      final result = await repository.getProductById(productId: productId);

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
