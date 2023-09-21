import 'package:equipo_estrella/colors.dart';
import 'package:equipo_estrella/shadows.dart';
import 'package:equipo_estrella/widgets/volunteer_card_description.dart';
import 'package:flutter/material.dart';

class VolunteerCard extends StatelessWidget {
  const VolunteerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: 234,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 24),
            decoration: ManosShadows.shadow1,
            child: Expanded(
              child: Column(children: [
                Expanded(
                  child: Image.asset(
                    "assets/placeholder.png",
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                    height: 138,
                  ),
                ),
                const Expanded(
                  child: VolunteerCardDescription(),
                )
              ]),
            )));
  }
}
