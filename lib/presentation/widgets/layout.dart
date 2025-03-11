import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/router/destination.dart';

class LayoutScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const LayoutScaffold({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: colors.primary,
        unselectedItemColor: colors.onSurface.withOpacity(0.40),
        elevation: 0,
        currentIndex: navigationShell.currentIndex,
        onTap: navigationShell.goBranch,
        items: destinations
            .map(
              (destination) => BottomNavigationBarItem(
                icon: Icon(destination.icon),
                label: destination.label,
              ),
            )
            .toList(),
      ),
    );
  }
}
