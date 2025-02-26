import 'package:flutter/material.dart';
import 'package:truequealo/config/helpers/test_data.dart';
import 'package:truequealo/presentation/widgets/posts/post_horizontal_listview.dart';
import 'package:truequealo/presentation/widgets/shared/CustomAppBar.dart';

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
                        PostHorizontalListView(
                          posts: testingPosts,
                          title: "Novedades del dia",
                        )
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

// Scaffold(
// appBar: AppBar(
// elevation: 1,
// backgroundColor: Colors.transparent,
// title: Image.asset(
// "assets/images/logo.png",
// width: 150,
// ),
// actions: [
// Padding(
// padding: const EdgeInsets.only(right: 16),
// child: CircleAvatar(
// backgroundColor: colors.secondaryContainer,
// child: Icon(
// Icons.person,
// color: Colors.grey.shade700,
// ),
// ),
// )
// ],
// ),
// body: Padding(
// padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// child: Column(
// children: [
// TextButton(
// onPressed: () {},
// child: Text(
// "Novedades del dia",
// style: textStyles.titleLarge,
// ),
// ),
// PostHorizontalListView(
// title: "Publicaciones del dia",
// posts: [],
// )
// ],
// ),
// ),
// );
