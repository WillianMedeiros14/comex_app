import 'dart:convert';

import 'package:comex_app/shared/data/http/http_client.dart';
import 'package:comex_app/shared/data/model/product_model.dart';
import 'package:comex_app/shared/data/repositories/i_product_repository.dart';
import 'package:comex_app/shared/errors/exceptions.dart';

class ProductRepository implements IProductRepository {
  final IHttpClient client;

  ProductRepository({required this.client});

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await client.get(
      url: 'http://192.168.1.101:8081/Product',
    );

    if (response.statusCode == 200) {
      final List<ProductModel> products = [];

      final body = jsonDecode(response.body);

      body.map((item) {
        final ProductModel product = ProductModel.fromMap(item);
        products.add(product);
      }).toList();

      return products;
    } else if (response.statusCode == 404) {
      throw NotFoundException('A url informada não é válida');
    } else {
      throw Exception('Não foi possível carregar os produtos');
    }
  }
}