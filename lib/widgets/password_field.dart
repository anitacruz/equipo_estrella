import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/commons/fonts.dart';
import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController? controller;

  final bool alwaysFloatingLabel;
  const PasswordFormField(
      {super.key, this.alwaysFloatingLabel = false, this.controller});

  @override
  @override
  PasswordFieldState createState() => PasswordFieldState();
}

class PasswordFieldState extends State<PasswordFormField> {
  late TextEditingController? _controller;
  bool _obscureText = true; //para ocultar o mostrar la contraseña

  @override
  void initState() {
    super.initState();
    // Usa el controlador proporcionado o crea uno nuevo si es null
    _controller = widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            floatingLabelBehavior: widget.alwaysFloatingLabel
                ? FloatingLabelBehavior.always
                : FloatingLabelBehavior.auto,
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

  @override
  void dispose() {
    // Solo disponemos el controlador si fue creado internamente
    if (widget.controller == null) {
      _controller?.dispose();
    }
    super.dispose();
  }
}
