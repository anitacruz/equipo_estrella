import 'package:equipo_estrella/controllers/auth_provider.dart';
import 'package:equipo_estrella/widgets/custom_form_field.dart';
import 'package:equipo_estrella/widgets/password_field.dart';
import 'package:equipo_estrella/widgets/primary_button.dart';
import 'package:equipo_estrella/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Register extends StatelessWidget {
  Register({super.key});
  final _name = TextEditingController();
  final _lastname = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final GoRouter router =
        GoRouter.of(context); // Obtiene el router de GoRouter

    print("Name: ${_name.text}, Lastname: ${_lastname.text}");
    print("Email: ${_email.text}, Password: ${_password.text}");

    return Scaffold(
      body: Consumer(builder: (context, ref, _) {
        final _auth = ref.watch(authenticationProvider);

        Future<void> _onPressedFunction() async {
          print("Name: ${_name.text}, Lastname: ${_lastname.text}");
          print("Email: ${_email.text}, Password: ${_password.text}");
          // Check email and password are not null
          if (_name.text.isEmpty || _lastname.text.isEmpty) {
            await showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text('Error Occured'),
                content: Text("Nombre o apellido vacíos"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text("OK"))
                ],
              ),
            );
            return;
          }
          if (_email.text.isEmpty || _password.text.isEmpty) {
            await showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text('Error Occured'),
                content: Text("Email o contraseña vacíos"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text("OK"))
                ],
              ),
            );
            return;
          }
          await _auth
              .signUpWithEmailAndPassword(_email.text, _password.text, context)
              .whenComplete(() async => await _auth
                  .createUserProfile(_name.text, _lastname.text, _email.text)
                  .whenComplete(() => router.go('/')));
        }

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                    top: 83), // Establece el margen superior en 83 píxeles
                child: Image.asset(
                  "assets/Ser_manos_logo.png",
                  width: 150,
                  height: 150,
                ),
              ),
              const SizedBox(height: 32), // Espacio entre la imagen y campos
              //Nombre
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomFormField(
                    fieldName: "Nombre",
                    hintText: "Ej: Juan",
                    alwaysFloatingLabel: true,
                    controller: _name),
              ),
              const SizedBox(height: 24), //Espacio
              //Apellido
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomFormField(
                    fieldName: "Apellido",
                    hintText: "Ej: Barcena",
                    alwaysFloatingLabel: true,
                    controller: _lastname),
              ),
              const SizedBox(height: 24), //Espacio
              //Email
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomFormField(
                    fieldName: "Email",
                    hintText: "Ej: juanbarcena@mail.com",
                    alwaysFloatingLabel: true,
                    controller: _email),
              ),
              const SizedBox(height: 24), //Espacio

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: PasswordFormField(
                    alwaysFloatingLabel: true, controller: _password),
              ),

              const Spacer(), // Espaciador para centrar verticalmente los botones
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PrimaryButton(
                    text: "Registrarse", onPressedMethod: _onPressedFunction),
              ),

              const SizedBox(height: 16), // Espacio entre los botones
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SecondaryButton(
                    text: "Ya tengo cuenta",
                    onPressedMethod: () {
                      router.go('/login');
                    }),
              ),
              const SizedBox(height: 32), // Espacio entre los botones
            ],
          ),
        );
      }),
    );
  }
}
