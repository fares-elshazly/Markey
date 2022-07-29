import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';

abstract class Helpers {
  static const _placeHolder = '-';

  static void setupLogger() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      if (kDebugMode) {
        print('${record.level.name}: ${record.time}: ${record.message}');
      }
    });
  }

  static void dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static String timeAgo(DateTime? dateTime) {
    if (dateTime == null) return _placeHolder;
    return timeago.format(dateTime);
  }

  static String previewDateTime(DateTime? dateTime) {
    if (dateTime == null) return _placeHolder;
    final now = DateTime.now();
    final difference = now.difference(dateTime).inDays;
    if (difference == 0) return formatTime(dateTime);
    return formatDate(dateTime);
  }

  static String formatDate(DateTime? dateTime) {
    if (dateTime == null) return _placeHolder;
    return DateFormat.yMMMMd().format(dateTime);
  }

  static String formatTime(DateTime? dateTime) {
    if (dateTime == null) return _placeHolder;
    return DateFormat.jm().format(dateTime);
  }
}
