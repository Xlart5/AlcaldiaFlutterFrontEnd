import 'package:flutter/material.dart';

class FieldBox extends StatelessWidget {
  final Color color;
  final String hintext;
  final int style;
  final double width;
  final double borderWidth;
  final IconData? icons;
  final AlignmentGeometry? align;
  final TextEditingController controller;

  const FieldBox(
      {super.key,
      required this.color,
      required this.hintext,
      required this.style,
      required this.width,
      this.borderWidth = 1,
      this.icons,
      this.align, required this.controller});
  @override
  Widget build(BuildContext context) {
    final List<InputBorder> inputs;
    final colors = Theme.of(context).colorScheme;

    inputs = [
      OutlineInputBorder(
          borderSide: BorderSide(
            color: colors.primary,
            width: 2,
          ),
          gapPadding: 8.0,
          borderRadius: BorderRadius.circular(20)),
      UnderlineInputBorder(borderSide: BorderSide(width: borderWidth)),
      InputBorder.none
    ];

    final inputDecoration = InputDecoration(
      contentPadding: const EdgeInsets.fromLTRB(8, 8, 12, 8),
      hintText: hintext,
      hintStyle: TextStyle(color: colors.secondary),
      icon: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Icon(
          icons,
          color: colors.secondary,
        ),
      ),
      fillColor: color,
      enabledBorder: inputs[style],
      focusedBorder: inputs[style],
      filled: true,
    );

    return Container(
      alignment: align,
      width: width,
      height: 60,
      child: TextFormField(
        controller: controller,
        decoration: inputDecoration,
      ),
    );
  }
}
