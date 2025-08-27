import 'package:flutter_dotenv/flutter_dotenv.dart';

enum AppEnv { dev, staging, prod }

/// Environment configuration holder
class EnvConfig {
  final AppEnv env;
  final String baseUrl;
  final String appName;
  final bool enableLogging;

  const EnvConfig._({
    required this.env,
    required this.baseUrl,
    required this.appName,
    required this.enableLogging,
  });


  /// Factory constructor to create EnvConfig from dotenv
  factory EnvConfig.fromDotEnv() {
    final rawEnv = dotenv.get('APP_ENV');
    final env = _mapEnv(rawEnv);

    return EnvConfig._(
      env: env,
      baseUrl: dotenv.get('BASE_URL'),
      appName: dotenv.get('APP_NAME'),
      enableLogging: dotenv.get('ENABLE_LOGGING').toLowerCase() == 'true',
    );
  }

  static AppEnv _mapEnv(String raw) {
    switch (raw.toLowerCase()) {
      case 'dev':
        return AppEnv.dev;
      case 'staging':
        return AppEnv.staging;
      case 'prod':
        return AppEnv.prod;
      default:
        throw Exception("Unknown APP_ENV: $raw");
    }
  }

  /// Helper
  bool get isDev => env == AppEnv.dev;
  bool get isStaging => env == AppEnv.staging;
  bool get isProd => env == AppEnv.prod;

  @override
  String toString() =>
      "EnvConfig(env: $env, baseUrl: $baseUrl, appName: $appName, logging: $enableLogging)";
}