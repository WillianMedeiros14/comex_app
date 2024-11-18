class OrderItemModel {
  final int id;
  final int productId;
  final int amount;
  final double unitPrice;
  final double total;
  final String nameProduct;
  final String imageProduct;

  OrderItemModel({
    required this.id,
    required this.productId,
    required this.amount,
    required this.unitPrice,
    required this.total,
    required this.nameProduct,
    required this.imageProduct,
  });

  factory OrderItemModel.fromMap(Map<String, dynamic> map) {
    return OrderItemModel(
      id: map['id'],
      productId: map['productId'],
      amount: map['amount'],
      unitPrice: map['unitPrice'].toDouble(),
      total: map['total'].toDouble(),
      nameProduct: map['nameProduct'],
      imageProduct: map['imageProduct'],
    );
  }
}
