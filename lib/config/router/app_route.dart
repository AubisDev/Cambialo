import 'package:go_router/go_router.dart';
import 'package:truequealo/presentation/screens/main/home_screen.dart';
import 'package:truequealo/presentation/screens/main/welcome_screen.dart';

final appRoute = GoRouter(
  initialLocation: "/welcome",
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/welcome',
      name: WelcomeScreen.name,
      builder: (context, state) => const WelcomeScreen(),
    ),
    //  GoRoute(path: '/login'),
    //  GoRoute(path: '/register'),
  ],
);
