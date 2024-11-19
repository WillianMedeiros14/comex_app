import 'package:intl/intl.dart';

double formatNumberToTwoDecimalPlaces(double value) {
  String valueFormat = "${NumberFormat('#,##0.00', 'pt_BR').format(value)}";
  return double.parse(valueFormat);
}

String formatPriceToTwoDecimalPlaces(double value) {
  return "R\$ ${NumberFormat('#,##0.00', 'pt_BR').format(value)}";
}
