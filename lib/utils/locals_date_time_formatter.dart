import 'package:flutter/material.dart';
import 'package:locals_demo/utils/localization_utils.dart';

abstract class LocalsDateTimeFormatter {
  static String naturalTimeInThePast(DateTime dateTime) {
    final difference = DateTime.now().difference(dateTime);
    if (difference.inDays > 0) {
      return '${difference.inDays} ${singularizeOrPluralize(difference.inDays, 'days')} ago';
    }
    if (difference.inHours > 0) {
      return '${difference.inHours} ${singularizeOrPluralize(difference.inHours, 'hours')} ago';
    }
    if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${singularizeOrPluralize(difference.inMinutes, 'minutes')} ago';
    }
    return 'now';
  }
}
