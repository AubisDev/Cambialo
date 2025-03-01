import 'package:flutter/material.dart';

class Category {
  final String id;
  final DateTime createdAt;
  final String name;
  final IconData icon;

  Category({
    required this.createdAt,
    required this.id,
    required this.name,
    required this.icon,
  });
}
