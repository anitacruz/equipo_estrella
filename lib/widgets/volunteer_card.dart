import 'package:equipo_estrella/colors.dart';
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
            decoration: BoxDecoration(
                color: ManosColors.neutral100,
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  // TODO: implement the shadow widgets
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3))
                ]),
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
