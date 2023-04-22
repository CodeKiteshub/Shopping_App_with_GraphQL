class DateFormatter {
  static String formatToShashedDateTime(DateTime dateTime) {
    return '\n${dateTime.day}/${dateTime.month}/${dateTime.year}  ${dateTime.hour}:${dateTime.minute}';
  }

  static String formatToShashedDateWithoutTime(DateTime dateTime) {
    return '\n${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  static String formatSecondsToString(int secs) {
    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (secs % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  static String formatToTextDateTime(DateTime datetime) {
    var month = '';
    switch (datetime.month) {
      case 1:
        month = "Jan";
        break;
      case 2:
        month = "Feb";
        break;
      case 3:
        month = "Mar";
        break;
      case 4:
        month = "April";
        break;
      case 5:
        month = "May";
        break;
      case 6:
        month = "June";
        break;
      case 7:
        month = "July";
        break;
      case 8:
        month = "Aug";
        break;
      case 9:
        month = "Sep";
        break;
      case 10:
        month = "Oct";
        break;
      case 11:
        month = "Nov";
        break;
      case 12:
        month = "Dec";
    }
    return "${datetime.day} $month'${datetime.year} ${timeFormatter(datetime)}";
  }

  static String timeFormatter(DateTime datetime) {
    var hour = datetime.hour;
    var period = 'AM';
    if (hour > 12) {
      hour -= 12;
      period = 'PM';
    }
    return "$hour:${datetime.minute} $period";
  }
}
