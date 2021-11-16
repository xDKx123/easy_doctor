import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class CustomLogger {
  Logger loggerDebug() {
    return Logger(
      printer: PrettyPrinter(
          printEmojis: false, colors: false, printTime: true, methodCount: 0),
      //output: SaveLoggerExtend(),
    );
  }

  Logger loggerRelease() {
    return Logger(
      printer: PrettyPrinter(
          printEmojis: false, colors: false, printTime: true, methodCount: 0),
      //filter: LoggerFilterExtend(),
      //output: SaveLoggerExtend(),
    );
  }

  Logger getLogger() {
    //Web + Debug
    if (kIsWeb && kDebugMode) {
      return loggerDebug();

      //Web + Release
    } else if (kIsWeb && !kDebugMode) {
      return loggerRelease();

      //Mobile + Debug
    } else if (!kIsWeb && kDebugMode) {
      return loggerDebug();

      //Mobile + Release
    } else if (!kIsWeb && !kDebugMode) {
      return loggerRelease();
    }

    return loggerDebug();
  }
}
