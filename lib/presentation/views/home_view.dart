import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truequealo/infrastructure/repositories/post_repository_impl.dart';
import 'package:truequealo/presentation/blocs/preferences_posts_cubit/preferences_posts_cubit.dart';
import 'package:truequealo/presentation/blocs/recent_posts_cubit/recent_posts_cubit.dart';
import 'package:truequealo/presentation/widgets/shared/CustomAppBar.dart';
import 'package:truequealo/presentation/widgets/widgets.dart';

import '../../infrastructure/datasources/post_supabase_datasource.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => PostRepositoryImpl(PostSupabaseDatasource()),
      child: MultiBlocProvider(providers: [
        BlocProvider<PreferencesPostsCubit>(
            create: (context) =>
                PreferencesPostsCubit(context.read<PostRepositoryImpl>())),
        BlocProvider<RecentPostsCubit>(
            create: (context) =>
                RecentPostsCubit(context.read<PostRepositoryImpl>())),
      ], child: const _HomeView()),
    );
  }
}

class _HomeView extends StatefulWidget {
  const _HomeView({
    super.key,
  });

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PreferencesPostsCubit>().loadInitialData();
      context.read<RecentPostsCubit>().loadInitialData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final recentPostsState = context.watch<RecentPostsCubit>().state;
    final preferencesPostsState = context.watch<PreferencesPostsCubit>().state;

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppBar(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 1,
            (context, index) {
              return Column(
                children: [
                  PostsSlideShow(posts: recentPostsState.posts),
                  const SizedBox(height: 30),
                  PostHorizontalListView(
                    posts: preferencesPostsState.posts,
                    title: "Tus preferencias",
                    loadNextPage: () =>
                        context.read<PreferencesPostsCubit>().onLoadNextPage(),
                  ),
                  const SizedBox(height: 30),
                  PostHorizontalListView(
                    posts: recentPostsState.posts,
                    title: "Novedades del dia",
                    loadNextPage: () =>
                        context.read<RecentPostsCubit>().onLoadNextPage(),
                  ),
                  const SizedBox(height: 30),
                  // PostHorizontalListView(
                  //   posts: [],
                  //   title: "Tal vez te interese",
                  // ),
                  // const SizedBox(height: 40),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
