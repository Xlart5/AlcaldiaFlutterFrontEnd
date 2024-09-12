import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentacion/screens/screens.dart';


final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
]);
