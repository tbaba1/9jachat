import 'dart:developer' as developer;
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import '../constants/app_config.dart';

class AppLogger {
  static const String _tag = '9jaChat';

  static void debug(String message, {String? tag}) {
    if (AppConfig.enableDebugMode) {
      developer.log(
        message,
        name: tag ?? _tag,
        level: 500, // Debug level
      );
    }
  }

  static void info(String message, {String? tag}) {
    developer.log(
      message,
      name: tag ?? _tag,
      level: 800, // Info level
    );
  }

  static void warning(String message, {String? tag}) {
    developer.log(
      message,
      name: tag ?? _tag,
      level: 900, // Warning level
    );
    
    if (AppConfig.enableCrashReporting) {
      FirebaseCrashlytics.instance.log('WARNING: $message');
    }
  }

  static void error(String message, {String? tag, dynamic error, StackTrace? stackTrace}) {
    developer.log(
      message,
      name: tag ?? _tag,
      level: 1000, // Error level
      error: error,
      stackTrace: stackTrace,
    );
    
    if (AppConfig.enableCrashReporting) {
      if (error != null) {
        FirebaseCrashlytics.instance.recordError(
          error,
          stackTrace,
          reason: message,
        );
      } else {
        FirebaseCrashlytics.instance.log('ERROR: $message');
      }
    }
  }

  static void fatal(String message, {String? tag, dynamic error, StackTrace? stackTrace}) {
    developer.log(
      message,
      name: tag ?? _tag,
      level: 1200, // Fatal level
      error: error,
      stackTrace: stackTrace,
    );
    
    if (AppConfig.enableCrashReporting) {
      FirebaseCrashlytics.instance.recordError(
        error ?? Exception(message),
        stackTrace,
        reason: message,
        fatal: true,
      );
    }
  }

  static void analytics(String event, {Map<String, dynamic>? parameters}) {
    if (AppConfig.enableAnalytics) {
      info('Analytics Event: $event ${parameters != null ? 'with parameters: $parameters' : ''}');
      // Firebase Analytics would be called here
    }
  }

  static void performance(String metric, {double? value, Map<String, String>? attributes}) {
    if (AppConfig.enablePerformanceMonitoring) {
      info('Performance Metric: $metric ${value != null ? 'value: $value' : ''} ${attributes != null ? 'attributes: $attributes' : ''}');
      // Firebase Performance would be called here
    }
  }
}
