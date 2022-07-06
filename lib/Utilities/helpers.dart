import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

abstract class Helpers {
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
}
