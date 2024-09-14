import 'package:alcaldia_front/config/router/add_router.dart';
import 'package:alcaldia_front/config/theme/app_theme.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'MePath',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectecColor: 1).getTheme(),
    );
  }
}
