import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vehicle_rental_app/views/auth/login_views.dart';
import 'package:vehicle_rental_app/views/splash/splash_views.dart';

import '../../views/profile/app_profile_view.dart';
import '../../views/vehicles/vehicles_detail_view.dart';
import '../../views/vehicles/vehicles_list_view.dart';

class AppRouter {

    /// The singleton instance of the router.
    static final AppRouter _instance = AppRouter._internal();
    /// Private constructor for the singleton pattern.
    AppRouter._internal();
    /// Factory method to return the singleton instance.
    factory AppRouter() {
      return _instance;
    }
    
    GoRouter appRouter ()=>  _router;
    /// The route configuration.
    final GoRouter _router = GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: RoutePath.splashView,
          builder: (BuildContext context, GoRouterState state) => const SplashViews(),
          routes: <RouteBase>[
            GoRoute(
              path: RoutePath.vehiclesListView,
              builder: (BuildContext context, GoRouterState state) => const VehiclesListView(),
            ),
            GoRoute(
              path: RoutePath.vehiclesDetailView,
              builder: (BuildContext context, GoRouterState state) => const VehiclesDetailView(),
            ),
            GoRoute(
              path: RoutePath.appProfileView,
              builder: (BuildContext context, GoRouterState state) => const AppProfileView(),
            ),
            GoRoute(
              path: RoutePath.login,
              builder: (BuildContext context, GoRouterState state) => const LoginView(),
            ),

          ],
        ),
      ],
   );
}


class RoutePath {
  static const String splashView = '/';
  static const String login = '/loginView';
  static const String vehiclesListView = '/vehiclesListView';
  static const String vehiclesDetailView = '/VehiclesDetailView';
  static const String appProfileView = '/appProfileView';

}





