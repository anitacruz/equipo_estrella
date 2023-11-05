import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/commons/fonts.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressedMethod;

  const PrimaryButton(
      {Key? key, required this.text, required this.onPressedMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => onPressedMethod(),
        child: Container(
            width: 1000,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: ManosColors.primary100),
            child: Text(
              text,
              style: ManosFonts.button(color: ManosColors.neutral100),
            )));
  }
}
