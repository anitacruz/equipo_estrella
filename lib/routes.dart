import 'package:equipo_estrella/models/volunteering_model.dart';
import 'package:equipo_estrella/views/expanded_volunteering.dart';
import 'package:equipo_estrella/views/log_in.dart';
import 'package:equipo_estrella/views/register.dart';
import 'package:equipo_estrella/views/starting.dart';
import 'package:equipo_estrella/views/welcome.dart';
import 'package:go_router/go_router.dart';

import 'main.dart';

final List<String> publicRoutes = ["/login", "/welcome", "/register"];
//TODO: check if already used the app / is already logged in
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
      //TODO: "Get volunteering by id";
      final vModel = VolunteeringModel(
          id: id!,
          category: "Categoría",
          title: "Título",
          imageUrl: "https://picsum.photos/200/300",
          subtitle: id.toString(),
          body: "Cuerpo",
          requirements: "Requisitos",
          location: "Ubicación",
          vacancies: 10,
          availability: '',
          subscribed: [],
          pending: []);

      return ExpandedVolunteer(vModel: vModel);
    },
  ),
  GoRoute(
    name: "login",
    path: "/login",
    builder: (context, state) => const LogIn(),
  ),
  GoRoute(
    path: "/register",
    builder: (context, state) => Register(),
  ),
  GoRoute(
    path: "/welcome",
    builder: (context, state) => const WelcomePage(),
  ),
];
