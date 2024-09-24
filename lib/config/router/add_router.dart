import 'package:alcaldia_front/presentacion/screens/History/saved_routes_screen.dart';
import 'package:go_router/go_router.dart';

import '../../presentacion/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/LogInScreen',
    builder: (context, state) => const LogInScreen(),
  ),
  GoRoute(
    path: '/LogInScreen2',
    builder: (context, state) => const LogIn2(),
  ),
  GoRoute(
    path: '/HomeScreen',
    builder: (context, state) => const HomeScreenView(),
  ),
  GoRoute(
    path: '/savedRoutes',
    builder: (context, state) => SavedRoutesScreen(),
  ),
  GoRoute(
    path: '/RoutesDetails',
    builder: (context, state) => const HomeScreenView(),
  ),
]);
