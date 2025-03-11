import 'package:flutter/material.dart';
import 'package:truequealo/domain/entities/category.dart';

import '../../domain/entities/activity.dart';

final List<Category> categories = [
  Category(id: 1, name: 'Accesorios de Vehiculos', icon: Icons.directions_car),
  Category(id: 2, name: 'Vehiculos', icon: Icons.car_rental),
  Category(id: 3, name: 'Celulares', icon: Icons.smartphone),
  Category(id: 4, name: 'Electronica Audio y Video', icon: Icons.headset),
  Category(id: 5, name: 'Hogar', icon: Icons.home),
  Category(id: 6, name: 'Construccion', icon: Icons.construction),
  Category(id: 7, name: 'Videojuegos', icon: Icons.videogame_asset),
  Category(id: 8, name: 'Gimnasio', icon: Icons.fitness_center),
  Category(id: 9, name: 'Herramientas', icon: Icons.build),
  Category(id: 10, name: 'Audio y Musica', icon: Icons.music_note),
  Category(id: 11, name: 'Ropa', icon: Icons.checkroom),
  Category(id: 12, name: 'Otros', icon: Icons.drag_handle),
];

final List<Activity> activities = [
  Activity(
      id: "a1",
      name: "Notificaciones",
      icon: Icons.notifications_active_outlined),
  Activity(
      id: "a2", name: "Mis preguntas", icon: Icons.question_answer_outlined),
  Activity(id: "a3", name: "Mis publicaciones", icon: Icons.newspaper_outlined),
  Activity(id: "a4", name: "Favoritos", icon: Icons.favorite_outline_sharp),
  Activity(
      id: "a5",
      name: "Preguntas frecuentes",
      icon: Icons.question_mark_outlined),
  Activity(id: "a6", name: "Soporte", icon: Icons.contact_support_outlined),
];
