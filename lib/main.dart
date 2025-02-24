import 'package:flutter/material.dart';
import 'package:truequealo/config/router/app_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRoute,
      title: 'Material App',
    );
  }
}
