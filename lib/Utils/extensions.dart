import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

extension DateFormatExtention on String {
    String covnertDateFormat() {
      try {
          // var format = DateFormat('MMM, d/yyyy', "en_US").add_jm();
          // var format = DateFormat('MMM d', "en_US").add_jm(); // Aug 11 8:55 AM]
          var format = DateFormat('MMM d', "en_US"); //Aug 11
          var dateString = format.format(DateTime.parse(this));
          var day = dateString.toString().split('T')[0];
          // var dateTime = dateString.toString().split(' ')[1];
          // var finalDate = "$day $dateTime";
          var finalDate = day;
          debugPrint(finalDate);
          return finalDate;
      } catch (e) {
        debugPrint(e.toString());
        rethrow;
      }
      }
 }

extension PasswordValidator on String {
  bool isValidPassword() {
  return RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
    .hasMatch(this);
  }
}
