import 'package:equipo_estrella/presentation/widgets/volunteer_card_description.dart';
import 'package:flutter/material.dart';

class VolunteerCard extends StatelessWidget {
  const VolunteerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            alignment: Alignment.center,
            width: 328,
            height: 234,
            decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                boxShadow: [
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
                    "assets/malata.jpg",
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ),
                ),
                const Expanded(
                  child: VolunteerCardDescription(),
                )
              ]),
            )));
  }
}
