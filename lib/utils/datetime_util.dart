import 'package:intl/intl.dart';

class DateTimeUtil {
  static formatDateTimeString(String dateTimeString, String formatString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    DateFormat outputFormat = DateFormat(formatString);
    return outputFormat.format(dateTime);
  }

  static formatDateTime(DateTime dateTime, String formatString) {
    DateFormat outputFormat = DateFormat(formatString);
    return outputFormat.format(dateTime);
  }

  static formatTimestamp(int timestamp, String formatString) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateTimeUtil.formatDateTime(dateTime, formatString);
  }

  static getYesterdayDateString(String formatString) {
    var dateTime = DateTime.now().subtract(Duration(days: 1));
    return DateTimeUtil.formatDateTime(dateTime, formatString);
  }

  static getTomorrowDateString(String formatString) {
    var dateTime = DateTime.now().add(Duration(days: 1));
    return DateTimeUtil.formatDateTime(dateTime, formatString);
  }

  static getTodayDateString(String formatString) {
    var dateTime = DateTime.now();
    return DateTimeUtil.formatDateTime(dateTime, formatString);
  }
}
