import 'package:comex_app/shared/data/model/category_model.dart';

class ProductModel {
  final int id;
  final String name;
  final String? description;
  final double price;
  final int availableQuantity;
  final String image;
  final int categoryId;

  final CategoryModel? category;

  ProductModel({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    required this.availableQuantity,
    required this.image,
    required this.categoryId,
    this.category,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['price'].toDouble(),
      availableQuantity: map['availableQuantity'],
      image: map['image'],
      categoryId: map['categoryId'],
      category: map['category'] != null
          ? CategoryModel.fromMap(map['category'])
          : null,
    );
  }
}
