import 'package:flutter/foundation.dart';

class AnsiColor {
  static const black = '\x1B[30m';
  static const red = '\x1B[31m';
  static const green = '\x1B[32m';
  static const yellow = '\x1B[33m';
  static const blue = '\x1B[34m';
  static const magenta = '\x1B[35m';
  static const cyan = '\x1B[36m';
  static const white = '\x1B[37m';
  static const reset = '\x1B[0m';

  // Background colors
  static const bgBlack = '\x1B[40m';
  static const bgRed = '\x1B[41m';
  static const bgGreen = '\x1B[42m';
  static const bgYellow = '\x1B[43m';
  static const bgBlue = '\x1B[44m';
  static const bgMagenta = '\x1B[45m';
  static const bgCyan = '\x1B[46m';
  static const bgWhite = '\x1B[47m';
}

enum PrintType {INFO, ERROR, WARNING, DEBUG, VERBOSE}

void printLog(String message, {PrintType type = PrintType.DEBUG}) {
  switch (type) {
    case PrintType.INFO:
      printColored(message, colorCode: AnsiColor.green);
      break;
    case PrintType.ERROR:
      printColored(message, colorCode: AnsiColor.red);
      break;
    case PrintType.WARNING:
      printColored(message, colorCode: AnsiColor.yellow);
      break;
    case PrintType.DEBUG:
      printColored(message, colorCode: AnsiColor.blue);
      break;
    case PrintType.VERBOSE:
      printColored(message, colorCode: AnsiColor.white);
      break;
  }
}

// Helper functions for colored printing
void printColored(String text, {String colorCode = AnsiColor.white, String bgColorCode = ''}) {
  if (kDebugMode) {
    print('$bgColorCode$colorCode$text${AnsiColor.reset}');
  }
}