import 'package:logger/logger.dart';

class TLoggerHelper {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(),
    //customize the log levels based on your needs
    level: Level.debug,
  );
  static void debug({required String message}) {
    _logger.d(message);
  }

  static void info({required String message}) {
    _logger.f(message);
  }

  static void warning({required String message}) {
    _logger.w(message);
  }

  static void error(String message, [dynamic error]) {
    _logger.e(message, error: error, stackTrace: StackTrace.current);
  }
}
