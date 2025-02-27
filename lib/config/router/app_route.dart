import 'package:go_router/go_router.dart';
import 'package:truequealo/presentation/screens/main/home_screen.dart';
import 'package:truequealo/presentation/screens/main/welcome_screen.dart';
import 'package:truequealo/presentation/views/activities_screen.dart';
import 'package:truequealo/presentation/views/categories_view.dart';
import 'package:truequealo/presentation/views/user_account_view.dart';

final appRoute = GoRouter(
  initialLocation: "/",
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
    GoRoute(
      path: '/categories',
      name: CategoriesView.name,
      builder: (context, state) => const CategoriesView(),
    ),
    GoRoute(
      path: '/activities',
      name: ActivitiesScreen.name,
      builder: (context, state) => const ActivitiesScreen(),
    ),
    GoRoute(
      path: '/user-account',
      name: UserAccountView.name,
      builder: (context, state) => const UserAccountView(),
    ),
    //  GoRoute(path: '/login'),
    //  GoRoute(path: '/register'),
  ],
);
