import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/commons/fonts.dart';
import 'package:flutter/material.dart';

class ShortButton extends StatelessWidget {
  final VoidCallback onPressedMethod;
  final bool disabled;
  final String text;

  const ShortButton(
      {Key? key,
      required this.onPressedMethod,
      this.disabled = false,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (!disabled) {
            onPressedMethod();
          }
        },
        child: IntrinsicWidth(
            child: Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: disabled
                        ? ManosColors.neutral25
                        : ManosColors.primary100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize:
                      MainAxisSize.min, // Establece el ancho mínimo necesario
                  children: [
                    Text(
                      text,
                      style: ManosFonts.button(color: ManosColors.neutral100),
                    )
                  ],
                ))));
  }
}
