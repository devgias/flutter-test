import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  const Failure({required this.message});

  /// Factory to create the right failure subtype from an exception.
  static Failure fromException(Object e) {
    if (e is DioException) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.connectionError) {
        return NetworkFailure(e.message ?? e.toString());
      }

      return ServerFailure(_dioErrorMessage(e));
    }
    if (e is SocketException || e is TimeoutException) {
      return NetworkFailure(e);
    }

    return OtherFailure(e);
  }

  /// Extract a concise message from a [DioException].
  static String _dioErrorMessage(DioException e) {
    final statusCode = e.response?.statusCode;
    final data = e.response?.data;
    final serverMessage = data is Map ? data['message'] : null;
    final parts = <String>[
      if (statusCode != null) '[$statusCode]',
      if (serverMessage != null)
        '$serverMessage'
      else if (e.message != null)
        e.message!,
    ];

    return parts.isNotEmpty ? parts.join(' ') : e.toString();
  }
}

class OtherFailure extends Failure {
  OtherFailure(Object message) : super(message: message.toString());
}

class ServerFailure extends Failure {
  ServerFailure(Object message) : super(message: message.toString());
}

class NetworkFailure extends Failure {
  NetworkFailure(Object message) : super(message: message.toString());
}

class ValidationFailure extends Failure {
  ValidationFailure(Object message) : super(message: message.toString());
}

class NotFoundFailure extends Failure {
  NotFoundFailure([Object? message])
      : super(message: message?.toString() ?? 'Data not found');
}

extension FailureUserMessage on Failure {
  String toUserMessage({
    String fallback = 'Something went wrong, please try again.',
    String networkFallback = 'Check your internet connection and try again.',
  }) {
    return switch (this) {
      NetworkFailure() => networkFallback,
      ServerFailure() || NotFoundFailure() || ValidationFailure() => message,
      _ => fallback,
    };
  }
}
