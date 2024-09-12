import 'dart:developer';

import 'package:alcaldia_front/config/router/add_router.dart';
import 'package:alcaldia_front/presentacion/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
            ),
            SizedBox(
                width: 300,
                child: Image(image: AssetImage("assets/logo1.png"))),
            SizedBox(
              height: 20,
            ),
            Text(
              "Registra tu movimiento",
              style: TextStyle(fontSize: 15, letterSpacing: 4),
            ),
          ],
        )),
        SizedBox(
            width: 300,
            child: OutlinedButton(
                onPressed: () {
                  context.push(LogInScreen.link);
                },
                child: const Text(
                  "Ingresar",
                  style: TextStyle(fontSize: 15, letterSpacing: 2),
                ))),
        const SizedBox(
          width: double.infinity,
          height: 300,
          child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://assets.zyrosite.com/cdn-cgi/image/format=auto,w=1080,fit=crop/m6LJ4Lz1DoFjjNNB/design-sem-nome-6-m5KblpervJHJo1pR.jpg")),
        )
      ],
    );
  }
}
