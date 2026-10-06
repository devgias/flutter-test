import 'package:auto_route/auto_route.dart';
import 'package:flutter_test_quiz/core/router.gr.dart';

final appRouter = AppRouter();

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  static final _appRoutes = [
    AutoRoute(page: UserListRoute.page, initial: true),
    AutoRoute(page: EditUserRoute.page),
    AutoRoute(page: AddUserRoute.page),
  ];

  @override
  List<AutoRoute> get routes => _appRoutes;
}
