import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/commons/fonts.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressedMethod;

  const SecondaryButton(
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
                color: Colors.transparent),
            child: Text(
              "Cancelar postulación",
              style: ManosFonts.button(color: ManosColors.primary100),
            )));
  }
}
