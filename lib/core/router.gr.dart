// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:flutter_test_quiz/features/user/presentation/pages/add_user_page.dart'
    as _i1;
import 'package:flutter_test_quiz/features/user/presentation/pages/edit_user_page.dart'
    as _i2;
import 'package:flutter_test_quiz/features/user/presentation/pages/user_list_page.dart'
    as _i3;

/// generated route for
/// [_i1.AddUserPage]
class AddUserRoute extends _i4.PageRouteInfo<void> {
  const AddUserRoute({List<_i4.PageRouteInfo>? children})
    : super(AddUserRoute.name, initialChildren: children);

  static const String name = 'AddUserRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddUserPage();
    },
  );
}

/// generated route for
/// [_i2.EditUserPage]
class EditUserRoute extends _i4.PageRouteInfo<EditUserRouteArgs> {
  EditUserRoute({
    _i5.Key? key,
    required String login,
    List<_i4.PageRouteInfo>? children,
  }) : super(
         EditUserRoute.name,
         args: EditUserRouteArgs(key: key, login: login),
         initialChildren: children,
       );

  static const String name = 'EditUserRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditUserRouteArgs>();
      return _i2.EditUserPage(key: args.key, login: args.login);
    },
  );
}

class EditUserRouteArgs {
  const EditUserRouteArgs({this.key, required this.login});

  final _i5.Key? key;

  final String login;

  @override
  String toString() {
    return 'EditUserRouteArgs{key: $key, login: $login}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EditUserRouteArgs) return false;
    return key == other.key && login == other.login;
  }

  @override
  int get hashCode => key.hashCode ^ login.hashCode;
}

/// generated route for
/// [_i3.UserListPage]
class UserListRoute extends _i4.PageRouteInfo<void> {
  const UserListRoute({List<_i4.PageRouteInfo>? children})
    : super(UserListRoute.name, initialChildren: children);

  static const String name = 'UserListRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.UserListPage();
    },
  );
}
