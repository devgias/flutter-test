// ignore_for_file: non_constant_identifier_names

import 'package:flutter_test_quiz/core/core.dart';
import 'package:injectable/injectable.dart';

final ENV = locator<AppEnv>();

abstract class AppEnv {
  final String baseUrl;

  final Duration connectTimeout;
  final Duration requestTimeout;
  const AppEnv({
    required this.baseUrl,
    required this.connectTimeout,
    required this.requestTimeout,
  });
}

@LazySingleton(as: AppEnv, env: [Environment.dev, Environment.test])
class AppEnvDev implements AppEnv {
  const AppEnvDev();

  @override
  final baseUrl = 'https://api.github.com';

  @override
  final connectTimeout = const Duration(seconds: 15);

  @override
  final requestTimeout = const Duration(seconds: 30);
}

@LazySingleton(as: AppEnv, env: [Environment.prod])
class AppEnvProduction implements AppEnv {
  const AppEnvProduction();

  @override
  final baseUrl = 'https://api.github.com';

  @override
  final connectTimeout = const Duration(seconds: 15);

  @override
  final requestTimeout = const Duration(seconds: 30);
}
