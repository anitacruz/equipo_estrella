import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/commons/fonts.dart';
import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({super.key});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordFormField> {
  bool _obscureText = true; //para ocultar o mostrar la contraseña

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: const BorderSide(color: ManosColors.neutral75),
            ),
            labelText: 'Contraseña',
            hintText: '********',
            labelStyle: ManosFonts.sub1(),
            contentPadding:
                const EdgeInsets.only(left: 16, right: 40, top: 16, bottom: 16),
            suffixIcon: IconButton(
              padding: const EdgeInsets.only(right: 12),
              color: ManosColors.neutral75,
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ),
          obscureText: _obscureText, // Ocultar/mostrar la contraseña
        ),
        // Puedes agregar más campos aquí
      ],
    );
  }
}
