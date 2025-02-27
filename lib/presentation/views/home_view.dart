import 'package:flutter/material.dart';
import 'package:truequealo/config/helpers/test_data.dart';
import 'package:truequealo/presentation/widgets/shared/CustomAppBar.dart';
import 'package:truequealo/presentation/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
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
                  PostsSlideShow(
                    posts: testingPosts,
                  ),
                  PostHorizontalListView(
                    posts: testingPosts,
                    title: "Tus preferencias",
                  ),
                  const SizedBox(height: 30),
                  PostHorizontalListView(
                    posts: testingPosts,
                    title: "Novedades del dia",
                  ),
                  const SizedBox(height: 30),
                  PostHorizontalListView(
                    posts: testingPosts,
                    title: "Tal vez te interese",
                  ),
                  const SizedBox(height: 40),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
