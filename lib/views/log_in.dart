import 'package:equipo_estrella/widgets/custom_form_field.dart';
import 'package:equipo_estrella/widgets/password_field.dart';
import 'package:equipo_estrella/widgets/buttons/primary_button.dart';
import 'package:equipo_estrella/widgets/buttons/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

import '../controllers/auth_controller.dart';

var logger = Logger();

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final password = TextEditingController();

    final GoRouter router = GoRouter.of(context);

    return Scaffold(
      body: Consumer(builder: (context, ref, _) {
        //  Consuming a provider using watch method and storing it in a variable
        //  Now we will use this variable to access all the functions of the
        //  authentication
        final auth = ref.watch(authControllerProvider.notifier);

        //  Instead of creating a clutter on the onPressed Function
        //  I have decided to create a seperate function and pass them into the
        //  respective parameters.
        //  if you want you can write the exact code in the onPressed function
        //  it all depends on personal preference and code readability
        Future<void> onPressedFunction() async {
          // logger.i(_email.text); // This are your best friend for debugging things
          //  not to mention the debugging tools
          // logger.i(_password.text);

          //loading();
          logger.i("Email: ${email.text}, Password: ${password.text}");
          // Check email and password are not null

          if (email.text.isEmpty || password.text.isEmpty) {
            await showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text('Error Occured'),
                content: const Text("Email o contraseña vacíos"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: const Text("OK"))
                ],
              ),
            );
            return;
          }
          await auth
              .signInWithEmailAndPassword(email.text, password.text, context)
              .whenComplete(() => auth.authStateChange.listen((event) async {
                    if (event == null) {
                      return;
                    }
                    router.go('/');
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
                child: CustomFormField(
                    fieldName: "Email", hintText: "", controller: email),
              ),
              const SizedBox(height: 24), //Espacio entre email y password
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: PasswordFormField(controller: password),
              ),

              const Spacer(), // Espaciador para centrar verticalmente los botones
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PrimaryButton(
                    text: "Iniciar Sesión", onPressedMethod: onPressedFunction),
              ),

              const SizedBox(height: 16), // Espacio entre los botones
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SecondaryButton(
                    text: "No tengo cuenta",
                    onPressedMethod: () {
                      router.go('/register');
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
