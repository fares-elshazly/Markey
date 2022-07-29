import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:timeago/timeago.dart' as timeago;

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
}
