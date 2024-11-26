import 'package:comex_app/features/orderCart/data/Model/create_order_model.dart';
import 'package:comex_app/shared/data/model/product_model.dart';

abstract class IProductRepository {
  Future<List<ProductModel>> getProducts();
  Future<ProductModel> getProductById({required int productId});
}
