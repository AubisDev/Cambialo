import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:truequealo/config/router/routes.dart';
import 'package:truequealo/presentation/views/activities_view.dart';
import 'package:truequealo/presentation/views/categories_view.dart';
import 'package:truequealo/presentation/views/home_view.dart';
import 'package:truequealo/presentation/views/user_account_view.dart';
import 'package:truequealo/presentation/widgets/layout.dart';

import '../../presentation/screens/post/post_by_category_screen.dart';
import '../../presentation/screens/post/post_screen.dart';

final _rootNavigationkey = GlobalKey<NavigatorState>(debugLabel: "root");

final appRoute = GoRouter(
  navigatorKey: _rootNavigationkey,
  initialLocation: Routes.home,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return LayoutScaffold(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (context, state) => const HomeView(),
              // routes: [
              //   GoRoute(
              //     path: Routes.post,
              //     builder: (context, state) {
              //       final postId =
              //           int.parse(state.pathParameters['postId'] ?? "0");
              //       return PostScreen(postId: postId);
              //     },
              //   ),
              // ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.categories,
              builder: (context, state) => const CategoriesView(),
              routes: [
                GoRoute(
                  path: Routes.postByCategoryId,
                  builder: (context, state) {
                    final categoryId =
                        int.parse(state.pathParameters['id'] ?? '0');
                    return PostByCategoryScreen(categoryId: categoryId);
                  },
                )
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.activities,
              builder: (context, state) => const ActivitiesView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.account,
              builder: (context, state) => const UserAccountView(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      name: 'post', // Agrega el nombre 'post' a la ruta
      path: '/post/:id',
      builder: (context, state) {
        final postId = int.parse(state.pathParameters['id'] ?? "no-id");
        return PostScreen(postId: postId);
      },
    ),
//  GoRoute(path: '/login'),
//  GoRoute(path: '/register'),
  ],
);
