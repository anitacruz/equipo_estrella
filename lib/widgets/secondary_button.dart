import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/commons/fonts.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressedMethod;
  final Color textColor;
  final bool? block;

  const SecondaryButton(
      {Key? key,
      required this.text,
      required this.onPressedMethod,
      this.block,
      this.textColor = ManosColors.primary100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => onPressedMethod(),
        child: Container(
            width: block == null ? 1000 : 100,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.transparent),
            child: Text(
              text,
              style: ManosFonts.button(color: textColor),
            )));
  }
}
