import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';

class convert_date {
  String convertDateFromString(String strDate) {
    DateTime todayDate = DateTime.parse(strDate).toLocal();
    var res =
        formatDate(todayDate, [dd, '/', mm, '/', yyyy, ' - ', hh, ':', nn]);
    return res;
  }
}
