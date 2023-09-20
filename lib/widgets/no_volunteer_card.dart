import 'package:equipo_estrella/colors.dart';
import 'package:flutter/material.dart';

class NoVolunteerCard extends StatelessWidget {
  const NoVolunteerCard({Key? key}) : super(key: key);

  // TODO: finish this Widget
  @override
  Widget build(BuildContext context) {
    return Container(
        color: ManosColors.neutral10,
        padding: const EdgeInsets.all(24),
        child: const Text(
            "Actualmente no hay voluntariados vigentes. Pronto se irán ircorporando nuevos"));
  }
}
