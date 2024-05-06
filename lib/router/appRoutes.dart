part of 'router.dart';

GoRoute _homeRoutes() {
  return GoRoute(
    path: AppRoutes.verify.routePath,
    builder: (context, state) {
      return RepositoryProvider.value(
        value: serviceLocator.getDetailsService(),
        child: const VerifyView(),
      );
    },
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.dashboard.routeSubPath,
        builder: (context, state) {
          int id = state.extra as int;
          return RepositoryProvider.value(
            value: serviceLocator.getDetailsService(),
            child: const DashboardView(),
          );
        },
      ),
    ],
  );
}
