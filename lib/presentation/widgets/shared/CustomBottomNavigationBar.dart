import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int, {bool initialLocation}) onDestinationSelected;
  final List<NavigationDestination> destinations;
  const CustomBottomNavigationBar(
      {super.key,
      required this.currentIndex,
      required this.onDestinationSelected,
      required this.destinations});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      showUnselectedLabels: true,
      currentIndex: widget.currentIndex,
      onTap: (value) => widget.onDestinationSelected(value),
      elevation: 0,
      selectedItemColor: colors.primary,
      unselectedItemColor: colors.onSurface.withOpacity(0.40),
      items: widget.destinations as List<BottomNavigationBarItem>,
    );
  }
}
