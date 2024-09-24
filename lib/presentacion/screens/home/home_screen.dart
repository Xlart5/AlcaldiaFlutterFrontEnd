import 'package:alcaldia_front/presentacion/providers/index_navbar_provider.dart';
import 'package:alcaldia_front/presentacion/screens/mapscreen/map_screen.dart';
import 'package:alcaldia_front/widgets/navigationbar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreenView extends ConsumerWidget {
  const HomeScreenView({super.key});
  static const String link = '/HomeScreen';

  @override
  Widget build(BuildContext context, ref) {
    final _page = ref.watch(pageIndexProvider);
    final _bottomNavigationKey = GlobalKey<CurvedNavigationBarState>();
    return Scaffold(
      bottomNavigationBar:
          curvednavbar(bottomNavigationKey: _bottomNavigationKey, page: _page),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.menu_outlined),
          )
        ],
        title: const _TitleAppbar(),
      ),
      body:
          _BodyHomeView(page: _page, bottomNavigationKey: _bottomNavigationKey),
    );
  }
}

class _BodyHomeView extends ConsumerWidget {
  const _BodyHomeView({
    super.key,
    required int page,
    required GlobalKey<CurvedNavigationBarState> bottomNavigationKey,
  })  : _page = page,
        _bottomNavigationKey = bottomNavigationKey;

  final int _page;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey;

  @override
  Widget build(BuildContext context, ref) {
    return Container(color: Colors.blueAccent, child: MapScreen());
  }
}

class _TitleAppbar extends StatelessWidget {
  const _TitleAppbar();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      children: [
        const SizedBox(
          width: 80,
          child: Image(
            image: AssetImage("assets/logo1.png"),
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
            child: Text(
          "Traza tu ruta",
          textAlign: TextAlign.center,
          style: TextStyle(color: colors.primary, fontWeight: FontWeight.w500),
        )),
      ],
    );
  }
}
