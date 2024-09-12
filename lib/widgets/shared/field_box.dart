import 'package:flutter/material.dart';

class FieldBox extends StatelessWidget {
  final Color color;
  final String hintext;

  const FieldBox({super.key, required this.color, required this.hintext});
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final outlineinputborder = OutlineInputBorder(
        borderSide: BorderSide(color: colors.primary),
        borderRadius: BorderRadius.circular(20));

    final inputDecoration = InputDecoration(
      hintText: hintext,
      fillColor: color,
      enabledBorder: outlineinputborder,
      focusedBorder: outlineinputborder,
      filled: true,
    );

    return SizedBox(
      width: 400,
      child: TextFormField(
        decoration: inputDecoration,
      ),
    );
  }
}
