import 'package:equipo_estrella/widgets/volunteer_card_description.dart';
import 'package:flutter/material.dart';
import '../commons/shadows.dart';

class VolunteerCard extends StatelessWidget {
  const VolunteerCard({Key? key, required this.category, required this.title})
      : super(key: key);

  final String category;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: 235, //247,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 24),
            decoration: ManosShadows.shadow1,
            child: Expanded(
              child: Column(children: [
                SizedBox(
                    height: 138,
                    child: Image.asset(
                      "assets/placeholder.png",
                      fit: BoxFit.fitWidth,
                      width: double.infinity,
                    )),
                Expanded(
                  child: VolunteerCardDescription(
                      category: category, title: title),
                )
              ]),
            )));
  }
}
