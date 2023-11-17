import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/commons/fonts.dart';
import 'package:equipo_estrella/controllers/auth_state_changes.dart';
import 'package:equipo_estrella/views/news_tab.dart';
import 'package:equipo_estrella/views/home_tab.dart';
import 'package:equipo_estrella/views/profile_tab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';

final authStateChanges = AuthStateChanges();
final _router = GoRouter(
  initialLocation: '/login',
  routes: routes, //Uso las rutas importadas del archivo routes
  refreshListenable: authStateChanges,
  redirect: (BuildContext context, GoRouterState state) {
    final loggedIn = FirebaseAuth.instance.currentUser != null;
    final isInPublicRoutes =
        publicRoutes.any((element) => element == state.uri.path);

    if (loggedIn && isInPublicRoutes) {
      logger.i("Redirecting to home from GoRouter");
      return '/';
    }

    if (!loggedIn && !isInPublicRoutes) {
      logger.i("Redirecting to login from GoRouter");
      logger
          .i("State name=${state.name}, path=${state.path}, ${state.uri.path}");
      return '/login';
    }

    // No se necesita redirección
    return null;
  },
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp())); // ProviderScope for Riverpod
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Ser Manos",
      theme: ThemeData(
          primaryColor: const Color.fromARGB(20, 144, 63, 1),
          useMaterial3: true),
      routerConfig: _router,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            backgroundColor: ManosColors.secondary10,
            appBar: AppBar(
              title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Image.asset(
                  "assets/logo_rectangular.png",
                  // fit: BoxFit.fitWidth,
                  fit: BoxFit.fitHeight,
                )
              ]),
              // title: Text(widget.title),
              backgroundColor: ManosColors.secondary100,
              bottom: TabBar(
                unselectedLabelColor: ManosColors.labelGrey,
                labelColor: ManosColors.neutral100,
                labelStyle: ManosFonts.b1(color: ManosColors.neutral100),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: ManosColors.neutral100,
                indicator: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: ManosColors.neutral100,
                        width: 2.0,
                      ),
                    ),
                    color: ManosColors.secondary200),
                tabs: const [
                  Tab(text: "Postularse"),
                  Tab(
                    text: "Mi Perfil",
                  ),
                  Tab(text: "Novedades"),
                ],
              ),
            ),
            body: const TabBarView(
                children: [HomeTab(), ProfileTab(), NewsTab()])));
  }
}
