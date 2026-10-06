import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_quiz/common/common.dart';

extension BuildContextExtension on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;

  double get height => MediaQuery.sizeOf(this).height;

  EdgeInsets get padding => MediaQuery.paddingOf(this);

  ThemeData get theme => Theme.of(this);

  CustomSnackbar get customSnackbar => CustomSnackbar.of(this);
}

extension BuildContextAutoRouteExtension on BuildContext {
  StackRouter get autoRoute => AutoRouter.of(this);

  Future<T?> push<T extends Object?>(
    PageRouteInfo route, {
    OnNavigationFailure? onFailure,
  }) =>
      autoRoute.push<T>(route, onFailure: onFailure);

  Future<T?> replace<T extends Object?>(
    PageRouteInfo route, {
    OnNavigationFailure? onFailure,
  }) =>
      autoRoute.replace<T>(route, onFailure: onFailure);
}

extension StringExtension on String? {
  /// Returns `null` when the string is null or only whitespace.
  String? get nullIfBlank {
    final value = this?.trim();

    return (value == null || value.isEmpty) ? null : value;
  }

  /// First letters of up to two words, e.g. `John Doe` -> `JD`.
  String get initials {
    final words = (this ?? '')
        .trim()
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .take(2);

    return words.map((word) => word[0].toUpperCase()).join();
  }
}
