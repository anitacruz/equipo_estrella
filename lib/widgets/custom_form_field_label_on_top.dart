import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/commons/fonts.dart';
import 'package:flutter/material.dart';

class CustomFormFieldLabelOnTop extends StatelessWidget {
  final String fieldName;
  const CustomFormFieldLabelOnTop({Key? key, required this.fieldName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: 'nombre@ejemplo.com',
            contentPadding:
                const EdgeInsets.only(left: 16, right: 40, top: 16, bottom: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: const BorderSide(color: ManosColors.neutral75),
            ),
            labelText: fieldName,
            labelStyle: ManosFonts.sub1(),
          ),
        ),
      ],
    );
  }
}
