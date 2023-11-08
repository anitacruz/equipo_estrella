import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/commons/fonts.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressedMethod;
  final bool disabled;

  const PrimaryButton(
      {Key? key,
      required this.text,
      required this.onPressedMethod,
      this.disabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (!disabled) {
            onPressedMethod();
          }
        },
        child: Container(
            width: 1000,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color:
                    disabled ? ManosColors.neutral25 : ManosColors.primary100),
            child: Text(
              text,
              style: ManosFonts.button(color: ManosColors.neutral100),
            )));
  }
}
