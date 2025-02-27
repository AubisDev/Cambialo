import 'package:go_router/go_router.dart';
import 'package:truequealo/presentation/screens/main/home_screen.dart';
import 'package:truequealo/presentation/screens/post/post_by_category_screen.dart';

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
      routes: [
        // GoRoute(path: 'post/:id', ),
        GoRoute(
          path: 'category/:id', // Ruta anidada para categorías
          builder: (context, state) {
            final categoryId = int.parse(state.pathParameters['id'] ?? '0');
            return PostByCategoryScreen(
              categoryId: categoryId,
            );
          },
        ),
      ],
    ),
    //  GoRoute(path: '/login'),
    //  GoRoute(path: '/register'),
    GoRoute(
      path: '/',
      redirect: (_, __) => 'home/0',
    )
  ],
);
