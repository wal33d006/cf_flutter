import 'package:intl/intl.dart';

String formatDate(String date) => DateFormat.yMMMd().format(DateTime.tryParse(date) ?? DateTime.now());
