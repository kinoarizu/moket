part of 'extensions.dart';

extension DateTimeExtension on DateTime {
  /// ---------------------------------------------------------
  /// [DATE TIME EXTENSION]
  /// Used to make additional method/getter from DateTime class
  /// ---------------------------------------------------------

  //* Getter to generate date & time as constant string
  String get dateAndtime => "${this.shortDayName} ${this.day}, ${this.hour}:00";

  //* Getter to switching day name to short day name
  String get shortDayName {
    switch (this.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      default:
        return 'Sun';
    }
  }

  //* Getter to switching day name
  String get dayName {
    switch (this.weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tueday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      default:
        return 'Sunday';
    }
  }

  //* Getter to generate month name
  String get monthName {
    switch (this.month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      default:
        return 'December';
    }
  }


}
