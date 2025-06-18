import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gulfnet_clean_arch_1/src/features/posts/presentation/pages/post_list_page.dart';
import 'package:gulfnet_clean_arch_1/src/routes/app_routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
      initialLocation: AppRoutes.home,
      routes: <RouteBase>[
        GoRoute(
            path: AppRoutes.home,
            builder: (BuildContext context, GoRouterState state) {
              return PostListPage();
            }),
        // GoRoute(
        //     path: AppRoutes.settings,
        //     builder: (BuildContext context, GoRouterState state) {
        //       return SettingsPage();
        //     })
      ],
      errorBuilder: (BuildContext context, GoRouterState state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('page not found: ${state.uri.toString()}'),
          ),
        );
      });
}
