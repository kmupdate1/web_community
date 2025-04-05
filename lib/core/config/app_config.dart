// lib/config/app_config.dart

class AppConfig {
	static const String env = String.fromEnvironment('ENV', defaultValue: 'prod');
	static const String apiVersion = String.fromEnvironment('API_V', defaultValue: 'v1');

	static String get basePath { return "/$env/$apiVersion"; }

	static bool get isDebug => env == 'dev';
	static bool get isStaging => env == 'stg';
	static bool get isProduction => env == 'prod';
}
