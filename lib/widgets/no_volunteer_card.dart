import 'package:equipo_estrella/commons/fonts.dart';
import 'package:equipo_estrella/commons/shadows.dart';
import 'package:flutter/material.dart';

class NoVolunteerCard extends StatelessWidget {
  const NoVolunteerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: 108,
            padding: const EdgeInsets.all(24),
            alignment: Alignment.center,
            decoration: ManosShadows.shadow1,
            child: Text(
              'Actualmente no hay voluntariados vigentes. Pronto se irán ircorporando nuevos',
              style: ManosFonts.sub1(),
              textAlign: TextAlign.center,
            )));
  }
}
