import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truequealo/infrastructure/repositories/post_repository_impl.dart';
import 'package:truequealo/presentation/blocs/post_bloc/post_bloc.dart';
import 'package:truequealo/presentation/widgets/shared/CustomAppBar.dart';
import 'package:truequealo/presentation/widgets/widgets.dart';

import '../../infrastructure/datasources/post_supabase_datasource.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final supabaseDatasource = PostSupabaseDatasource();
    final postRepository = PostRepositoryImpl(supabaseDatasource);

    return BlocProvider(
      create: (context) =>
          PostBloc(postRepository)..add(FetchedHomeDataEvent()),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({
    super.key,
  });

  void fetchHomeData(BuildContext context) {
    context.read<PostBloc>().add(FetchedHomeDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state.recentsPosts.isEmpty &&
            state.preferencesPosts.isEmpty &&
            state.error.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.error.isNotEmpty) {
          return Center(child: Text('Error: ${state.error}'));
        } else {
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
                        PostsSlideShow(posts: state.recentsPosts),
                        PostHorizontalListView(
                          posts: state.preferencesPosts,
                          title: "Tus preferencias",
                        ),
                        const SizedBox(height: 30),
                        PostHorizontalListView(
                          posts: state.recentsPosts,
                          title: "Novedades del dia",
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
      },
    );
  }
}
