import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentView;
  const CustomBottomNavigationBar({super.key, required this.currentView});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      case 2:
        context.go('/home/2');
        break;
      case 3:
        context.go('/home/3');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      showUnselectedLabels: true,
      currentIndex: widget.currentView,
      onTap: (value) => onItemTapped(context, value),
      elevation: 0,
      selectedItemColor: colors.primary,
      unselectedItemColor: colors.onSurface.withOpacity(0.40),
      items: const [
        BottomNavigationBarItem(
          label: "Inicio",
          icon: Icon(Icons.home_max),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt_outlined),
          label: 'Categorias',
        ),
        BottomNavigationBarItem(
          label: "Actividades",
          icon: Icon(Icons.timeline_outlined),
        ),
        BottomNavigationBarItem(
          label: "Cuenta",
          icon: Icon(Icons.account_circle_outlined),
        ),
      ],
    );
  }
}
