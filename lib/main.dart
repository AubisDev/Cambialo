import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:truequealo/config/router/app_route.dart';

import 'config/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://yplqeodtkmvrnpdbweyd.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlwbHFlb2R0a212cm5wZGJ3ZXlkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA3NTkzODYsImV4cCI6MjA1NjMzNTM4Nn0.P72GXsASPHZ_qy-qSQh7MyY4alZ1iLtaxvGGXBUeAG4',
  );
  runApp(MyApp());
}

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
