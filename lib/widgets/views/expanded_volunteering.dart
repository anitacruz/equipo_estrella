import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/commons/fonts.dart';
import 'package:flutter/material.dart';

import '../card_chip.dart';
import '../cards/location_card.dart';

class ExpandedVolunteer extends StatelessWidget {
  final String category;
  final String title;
  final String imageUrl;
  final String subtitle;
  final String body;
  final String requirements;
  final String location;

  const ExpandedVolunteer({
    Key? key,
    required this.category,
    required this.title,
    required this.imageUrl,
    required this.subtitle,
    required this.body,
    required this.requirements,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: ManosColors.neutral100,
            onPressed: () => Navigator.of(context).pop(),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  imageUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
            child: Container(
                alignment: Alignment.topCenter,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(category,
                        style:
                            ManosFonts.overline(color: ManosColors.neutral0)),
                    const SizedBox(height: 16),
                    Text(
                      title,
                      style: ManosFonts.h2(),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      subtitle,
                      style: ManosFonts.sub1(color: ManosColors.secondary200),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Sobre la actividad",
                      style: ManosFonts.h2(),
                    ),
                    const SizedBox(height: 16),
                    Text(body,
                        style: ManosFonts.b1(color: ManosColors.neutral0)),
                    const SizedBox(height: 16),
                    LocationCard(location: location),
                    const SizedBox(height: 16),
                    Text(location,
                        style: ManosFonts.b1(color: ManosColors.neutral0)),
                    const SizedBox(height: 16),
                    Text(
                      "Participar del voluntariado",
                      style: ManosFonts.h2(),
                    ),
                    const SizedBox(height: 16),
                    Text(requirements,
                        style: ManosFonts.b1(color: ManosColors.neutral0)),
                    const SizedBox(height: 16),
                    const CardChip(amount: 10, isAvailable: true)
                    // Container(
                    //     alignment: Alignment.center,
                    //     child:
                    //         Text("Comparte esta nota", style: ManosFonts.h2())),
                    // const SizedBox(height: 16),
                    // Container(
                    //     width: 1000,
                    //     alignment: Alignment.center,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(4),
                    //         color: ManosColors.primary100),
                    //     child: TextButton(
                    //         onPressed: () => {},
                    //         child: Text(
                    //           "Compartir",
                    //           style: ManosFonts.button(
                    //               color: ManosColors.neutral100),
                    //         )))
                  ],
                ))));
  }
}
