import 'package:intl/intl.dart';

class DateConverter {
  static String formatDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd hh:mm:ss').format(dateTime);
  }

  static String estimatedDate(DateTime dateTime) {
    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  static String slotDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  static DateTime convertStringToDatetime(String dateTime) {
    return DateFormat("yyyy-MM-ddTHH:mm:ss.SSS").parse(dateTime);
  }
  // static String localDateToIsoStringAMPM(DateTime dateTime, BuildContext context) {
  //   return DateFormat('${_timeFormatter(context)} | d-MMM-yyyy ').format(dateTime.toLocal());
  // }

  static DateTime isoStringToLocalDate(String dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').parse(dateTime, true).toLocal();
  }

  static String isoStringToLocalTimeOnly(String dateTime) {
    return DateFormat('HH:mm').format(isoStringToLocalDate(dateTime));
  }
  static String isoStringToLocalTimeWithAMPMOnly(String dateTime) {
    return DateFormat('hh:mm a').format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalTimeWithAmPmAndDay(String dateTime) {
    return DateFormat('hh:mm a, EEE').format(isoStringToLocalDate(dateTime));
  }
  // static String stringToStringTime(String dateTime, BuildContext context) {
  //   DateTime inputDate = DateFormat('HH:mm:ss').parse(dateTime);
  //   return DateFormat(_timeFormatter(context)).format(inputDate);
  // }
  static String isoStringToLocalAMPM(String dateTime) {
    return DateFormat('a').format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalDateOnly(String dateTime) {
    return DateFormat('dd MMM yyyy').format(isoStringToLocalDate(dateTime));
  }

  static String localDateToIsoString(DateTime dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(dateTime.toUtc());
  }
  static String isoDayWithDateString(String dateTime) {
    return DateFormat('EEE, MMM d, yyyy').format(isoStringToLocalDate(dateTime));
  }
  static String convertToAgo(String input){
    DateTime time = DateTime.parse(input);
    Duration diff = DateTime.now().difference(time);

    if(diff.inDays >= 1){
      return '${diff.inDays} day ago';
    } else if(diff.inHours >= 1){
      return '${diff.inHours} hour ago';
    } else if(diff.inMinutes >= 1){
      return '${diff.inMinutes} minute ago';
    } else if (diff.inSeconds >= 1){
      return '${diff.inSeconds} second ago';
    } else {
      return 'just now';
    }
  }

  // static String convertTimeRange(String start, String end, BuildContext context) {
  //   DateTime _startTime = DateFormat('HH:mm:ss').parse(start);
  //   DateTime _endTime = DateFormat('HH:mm:ss').parse(end);
  //   return '${DateFormat('${_timeFormatter(context)}').format(_startTime)} - ${DateFormat('${_timeFormatter(context)}').format(_endTime)}';
  // }

  static DateTime stringTimeToDateTime(String time) {
    return DateFormat('HH:mm:ss').parse(time);
  }



}