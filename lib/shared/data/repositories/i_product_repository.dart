import 'package:comex_app/shared/data/model/product_model.dart';

abstract class IProductRepository {
  Future<List<ProductModel>> getProducts();
}
