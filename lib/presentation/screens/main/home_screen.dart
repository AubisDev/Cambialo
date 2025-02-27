import 'package:flutter/material.dart';
import 'package:truequealo/presentation/views/views.dart';
import 'package:truequealo/presentation/widgets/shared/CustomBottomNavigationBar.dart';

class HomeScreen extends StatefulWidget {
  static const name = "home-screen";

  final int pageIndex;
  const HomeScreen({super.key, required this.pageIndex});

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

    if (pageController.hasClients) {
      pageController.animateToPage(
        widget.pageIndex,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    }

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: pageViews,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentView: widget.pageIndex,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
