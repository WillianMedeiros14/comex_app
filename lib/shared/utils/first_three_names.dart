import 'package:comex_app/shared/data/model/order_item_model.dart';

String firstThreeNamesOrderItems(List<OrderItemModel> orderItems) {
  List<String> firstThreeNames =
      orderItems.take(3).map((item) => item.nameProduct).toList();

  String result = firstThreeNames.join(', ');

  return result;
}
