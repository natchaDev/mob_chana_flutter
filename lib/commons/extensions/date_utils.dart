import 'package:intl/intl.dart';

extension convertDateTime on DateTime {
  String toDateTimeString(DateFormat dateFormat) {
    return dateFormat.format(this);
  }
}

extension Utils on String {
  DateTime toDate(String format) {
    final f = DateFormat(format);
    return f.parse(this);
  }
}