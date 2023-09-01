import 'package:equipo_estrella/widgets/scrollable_card_list.dart';
import 'package:flutter/material.dart';
import 'widgets/volunteer_card.dart';
import 'presentation/views/profile.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Container(
            margin: const EdgeInsets.only(top: 24, left: 16, right: 16),
            child: const Column(children: [
              TextField(
                decoration: InputDecoration(
                    // border: OutlineInputBorder(),
                    labelText: 'Buscar',
                    prefixIcon: Icon(Icons.search, size: 24),
                    suffixIcon: Icon(Icons.map,
                        size: 24, color: Color.fromARGB(255, 20, 144, 63))),
              ),
              Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "Voluntariados",
                    style: TextStyle(fontSize: 24),
                  )),
              ScrollableCardList(),
            ])));
  }
}
