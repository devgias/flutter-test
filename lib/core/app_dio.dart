import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_test_quiz/core/core.dart';
import 'package:flutter_test_quiz/utils/utils.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class AppDio with DioMixin implements Dio {
  static final _internal = AppDio();

  AppDio([AppBaseOptions? appBaseOptions]) {
    options = appBaseOptions ?? AppBaseOptions();

    interceptors.add(
      TalkerDioLogger(
        talker: AppTalker.talker,
        settings: const TalkerDioLoggerSettings(printRequestHeaders: true),
      ),
    );

    httpClientAdapter = IOHttpClientAdapter();
  }

  static AppDio get instance => _internal;
}

class AppBaseOptions extends BaseOptions {
  AppBaseOptions({Map<String, dynamic>? headers})
      : super(
          baseUrl: ENV.baseUrl,
          contentType: Headers.jsonContentType,
          connectTimeout: ENV.connectTimeout,
          sendTimeout: ENV.requestTimeout,
          receiveTimeout: ENV.requestTimeout,
          headers: {..._defaultHeaders, ...?headers},
        );

  static Map<String, dynamic> get _defaultHeaders => {
        'Content-type': Headers.jsonContentType,
      };
}
