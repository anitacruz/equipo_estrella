import 'package:equipo_estrella/controllers/auth_provider.dart';
import 'package:equipo_estrella/widgets/custom_form_field.dart';
import 'package:equipo_estrella/widgets/password_field.dart';
import 'package:equipo_estrella/widgets/primary_button.dart';
import 'package:equipo_estrella/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    final _email = TextEditingController();
    final _password = TextEditingController();

    return Scaffold(
      body: Consumer(builder: (context, ref, _) {
        //  Consuming a provider using watch method and storing it in a variable
        //  Now we will use this variable to access all the functions of the
        //  authentication
        final _auth = ref.watch(authenticationProvider);

        //  Instead of creating a clutter on the onPressed Function
        //  I have decided to create a seperate function and pass them into the
        //  respective parameters.
        //  if you want you can write the exact code in the onPressed function
        //  it all depends on personal preference and code readability
        Future<void> _onPressedFunction() async {
          // print(_email.text); // This are your best friend for debugging things
          //  not to mention the debugging tools
          // print(_password.text);

          //loading();
          print("Email: ${_email.text}, Password: ${_password.text}");
          // Check email and password are not null

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
              .signInWithEmailAndPassword(_email.text, _password.text, context)
              .whenComplete(() => _auth.authStateChange.listen((event) async {
                    if (event == null) {
                      return;
                    }
                  }));
        }

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                    top: 229), // Establece el margen superior en 229 píxeles
                child: Image.asset(
                  "assets/Ser_manos_logo.png",
                  width: 150,
                  height: 150,
                ),
              ),
              const SizedBox(height: 32), // Espacio entre la imagen y campos
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomFormField(fieldName: "Email", controller: _email),
              ),
              const SizedBox(height: 24), //Espacio entre email y password
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: PasswordFormField(controller: _password),
              ),

              const Spacer(), // Espaciador para centrar verticalmente los botones
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PrimaryButton(
                    text: "Iniciar Sesión",
                    onPressedMethod: _onPressedFunction),
              ),

              const SizedBox(height: 16), // Espacio entre los botones
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SecondaryButton(
                    text: "No tengo cuenta", onPressedMethod: () {}),
              ),
              const SizedBox(height: 32), // Espacio entre los botones
            ],
          ),
        );
      }),
    );
  }
}
