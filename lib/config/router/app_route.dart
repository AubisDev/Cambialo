import 'package:go_router/go_router.dart';

final appRoute = GoRouter(
  initialLocation: "/home",
  routes: [
    GoRoute(path: '/home'),
    GoRoute(path: '/login'),
    GoRoute(path: '/register'),
  ],
);
