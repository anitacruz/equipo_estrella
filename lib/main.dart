import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/hometab.dart';
import 'package:flutter/material.dart';
import 'widgets/volunteer_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.primaryColor),
        primaryColor: const Color.fromARGB(20, 144, 63, 1),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "Equipo Estrella"),
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
              title: Text(widget.title),
              backgroundColor: ManosColors.secondary100,
              bottom: const TabBar(
                tabs: [
                  Tab(text: "Postularse"),
                  Tab(
                    text: "Mi Perfil",
                  ),
                  Tab(text: "Novedades")
                ],
              ),
            ),
            body: const TabBarView(
                children: [HomeTab(), VolunteerCard(), VolunteerCard()])));
  }
}
