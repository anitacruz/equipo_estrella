import 'package:equipo_estrella/widgets/cards/volunteer_card_description.dart';
import 'package:flutter/material.dart';

import '../../commons/shadows.dart';
import '../views/expanded_volunteering.dart';

class VolunteerCard extends StatelessWidget {
  const VolunteerCard({Key? key, required this.category, required this.title})
      : super(key: key);

  final String category;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
            onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExpandedVolunteer(
                              category: category,
                              title: title,
                              imageUrl: "assets/news_image.png",
                              subtitle: "Esto es un subtitulo",
                              body: "esto es un body",
                              requirements: "requirements ?",
                              location: "Buenos aires")))
                },
            child: Container(
                // height: 235, //247,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 24),
                decoration: ManosShadows.shadow1,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset("assets/placeholder.png",
                          height: 138, fit: BoxFit.cover),
                      VolunteerCardDescription(category: category, title: title)
                    ]))));
  }
}


//TODO: intrinsinc height