import 'package:flutter/material.dart';
import 'package:truequealo/config/router/app_route.dart';

import 'config/theme/app_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      routerConfig: appRoute,
      title: 'Truequealo',
    );
  }
}
