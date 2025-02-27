import 'package:flutter/material.dart';
import 'package:truequealo/presentation/views/views.dart';

class HomeScreen extends StatefulWidget {
  static const name = "home-screen";

  final Widget? child;
  const HomeScreen({super.key, this.child});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  late PageController pageController;

  List<Widget> pageViews = const [
    HomeView(),
    CategoriesView(),
    ActivitiesView(),
    HomeView(),
  ];

  @override
  void initState() {
    pageController = PageController(keepPage: true);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: widget.child ??
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: pageViews,
          ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
