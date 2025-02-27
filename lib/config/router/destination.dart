import 'package:flutter/material.dart';

class Destination {
  final String label;
  final IconData icon;

  Destination({required this.label, required this.icon});
}

final destinations = [
  Destination(label: "Inicio", icon: Icons.home_max_outlined),
  Destination(label: 'Categorias', icon: Icons.list_alt_outlined),
  Destination(label: "Actividades", icon: Icons.timeline_outlined),
  Destination(label: "Cuenta", icon: Icons.account_circle_outlined),
];
