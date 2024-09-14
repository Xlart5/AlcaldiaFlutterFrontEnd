import 'package:flutter/material.dart';

class Outlinedbutton extends StatelessWidget {
  final String text;
  const Outlinedbutton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return OutlinedButton(
        style: ButtonStyle(
          side: WidgetStatePropertyAll(
              BorderSide(color: colors.primary, width: 2)),
          elevation: const WidgetStatePropertyAll(4),
        ),
        onPressed: () {},
        child: Text(
          text,
          style:
              TextStyle(fontSize: 16, letterSpacing: 1, color: colors.primary),
        ));
  }
}
