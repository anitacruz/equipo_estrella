import 'package:equipo_estrella/models/volunteering_model.dart';
import 'package:equipo_estrella/widgets/cards/volunteer_card_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../commons/shadows.dart';
import '../../views/expanded_volunteering.dart';

var logger = Logger();

class VolunteerCard extends ConsumerWidget {
  const VolunteerCard({Key? key, required this.vModel}) : super(key: key);

  final VolunteeringModel vModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
        child: InkWell(
            onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExpandedVolunteer(
                              id: vModel.id,
                              category: vModel.category,
                              title: vModel.title,
                              imageUrl: vModel.imageUrl,
                              subtitle: vModel.subtitle,
                              body: vModel.body,
                              requirements: vModel.requirements,
                              location: vModel.location,
                              vacancies: (vModel.vacancies -
                                  vModel.pending
                                      .length), //TODO: its subscribed not pending
                              availability: vModel.availability)))
                },
            child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 24),
                decoration: ManosShadows.shadow1,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.network(vModel.imageUrl,
                          height: 138, fit: BoxFit.cover),
                      VolunteerCardDescription(
                          id: vModel.id,
                          category: vModel.category,
                          title: vModel.title,
                          vacancies: (vModel.vacancies - vModel.pending.length))
                    ]))));
  }
}


//TODO: intrinsinc height