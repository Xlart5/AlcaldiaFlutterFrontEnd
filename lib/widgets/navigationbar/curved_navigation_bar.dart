import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../presentacion/providers/index_navbar_provider.dart';

class curvednavbar extends ConsumerWidget {
  const curvednavbar({
    super.key,
    required GlobalKey<CurvedNavigationBarState> bottomNavigationKey,
    required int page,
  }) : _bottomNavigationKey = bottomNavigationKey, _page = page;

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey;
  final int _page;

  @override
  Widget build(BuildContext context,ref) {
    return CurvedNavigationBar(
      items: [
        Icon(Icons.history, size: 30),
        Icon(Icons.home_outlined, size: 30),
        Icon(Icons.settings, size: 30),
      ],
      key: _bottomNavigationKey,
      index: _page,
      color: Colors.white,
      buttonBackgroundColor: Colors.white,
      backgroundColor: Colors.blueAccent,
      onTap: (index) {
        // Cambiar el estado usando el provider cuando el usuario cambia de página
        ref.read(pageIndexProvider.notifier).state = index;
        if (index == 0) {
          context.push('/savedRoutes'); // Redirigir al historial
        } else if (index == 1) {
          context.go('/HomeScreen'); // Redirigir al mapa
        }
      },
      letIndexChange: (index) => true,
    );
  }
}