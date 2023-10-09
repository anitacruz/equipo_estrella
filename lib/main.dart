import 'package:equipo_estrella/admintab.dart';
import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/commons/fonts.dart';
import 'package:equipo_estrella/widgets/views/news_tab.dart';
import 'package:equipo_estrella/widgets/cards/no_volunteer_card.dart';
import 'package:equipo_estrella/widgets/views/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:go_router/go_router.dart';

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(title: "Equipo Estrella"),
    ),
  ],
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Flutter Demo",
      theme: ThemeData(
          primaryColor: const Color.fromARGB(20, 144, 63, 1), useMaterial3: true),
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
        length: 4,
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
                  Tab(text: "Admin")
                ],
              ),
            ),
            body: const TabBarView(children: [
              HomeTab(),
              NoVolunteerCard(),
              NewsTab(),
              AdminTab()
            ])));
  }
}
