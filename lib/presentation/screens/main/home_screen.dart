import 'package:flutter/material.dart';
import 'package:truequealo/config/helpers/test_data.dart';
import 'package:truequealo/presentation/widgets/shared/CustomAppBar.dart';
import 'package:truequealo/presentation/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  static const name = "home-screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    return Container(
      color: colors.surface,
      child: PageView(
        children: [
          CustomScrollView(
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
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
