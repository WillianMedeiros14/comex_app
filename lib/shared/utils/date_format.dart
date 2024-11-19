import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  final DateFormat dateFormat = DateFormat("dd/MM/yyyy 'às' HH:mm 'hs'");
  return dateFormat.format(dateTime);
}
