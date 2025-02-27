import 'package:go_router/go_router.dart';
import 'package:truequealo/presentation/screens/main/home_screen.dart';

final appRoute = GoRouter(
  initialLocation: "/home/0",
  routes: [
    GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndex = int.parse(state.pathParameters['page'] ?? '0');
        return HomeScreen(pageIndex: pageIndex);
      },
    ),
    //  GoRoute(path: '/login'),
    //  GoRoute(path: '/register'),
    GoRoute(
      path: '/',
      redirect: (_, __) => 'home/0',
    )
  ],
);
