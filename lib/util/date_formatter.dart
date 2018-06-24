import 'package:intl/intl.dart';

class DateFormatter{
  static String getYear(String date){
    var formatter = new DateFormat('yyyy');
    var releaseDate = DateTime.parse(date);
    return formatter.format(releaseDate);
  }
}