import 'package:equipo_estrella/widgets/views/expanded_volunteering.dart';
import 'package:equipo_estrella/widgets/views/log_in.dart';
import 'package:equipo_estrella/widgets/views/register.dart';
import 'package:equipo_estrella/widgets/views/starting.dart';
import 'package:go_router/go_router.dart';

import 'main.dart';



final List<GoRoute> routes = [
  GoRoute(
    path: '/',
    builder: (context, state) => const MyHomePage(title: "Equipo Estrella"),
  ),
  GoRoute(
    path: '/starting',
    builder: (context, state) => const StartingPage(),
  ),
  GoRoute(
    path: '/volunteerings/:id',
    builder: (context, state) {
      final id = state.pathParameters['id'];
      return ExpandedVolunteer(
        category: "Categoría",
        title: "Título",
        imageUrl: "https://picsum.photos/200/300",
        subtitle: id.toString(),
        body: "Cuerpo",
        requirements: "Requisitos",
        location: "Ubicación",
      );
    },
  ),
  GoRoute(
    path: "/login",
    builder: (context, state) => const LogIn(),
  ),
  GoRoute(
    path: "/register",
    builder: (context, state) => const Register(),
  ),
];
