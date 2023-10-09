import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/commons/fonts.dart';
import 'package:equipo_estrella/widgets/primaryButton.dart';
import 'package:equipo_estrella/widgets/secondaryButton.dart';
import 'package:flutter/material.dart';

import '../card_chip.dart';
import '../cards/location_card.dart';

class ExpandedVolunteer extends StatefulWidget {
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

  final String category;
  final String title;
  final String imageUrl;
  final String subtitle;
  final String body;
  final String requirements;
  final String location;

  @override
  State<StatefulWidget> createState() => _ExpandedVolunteerState();
}

enum VolunteerState {
  inState,
  outState,
  pendingState,
}

class _ExpandedVolunteerState extends State<ExpandedVolunteer> {
  VolunteerState _volunteerState = VolunteerState.outState;

  void applyToVolunteer() {
    setState(() {
      _volunteerState = VolunteerState.pendingState;
    });
  }

  void cancelApplication() {
    setState(() {
      _volunteerState = VolunteerState.outState;
    });
  }

  void acceptApplication() {
    setState(() {
      _volunteerState = VolunteerState.inState;
    });
  }

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
                  widget.imageUrl,
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
                    Text(widget.category,
                        style:
                            ManosFonts.overline(color: ManosColors.neutral0)),
                    const SizedBox(height: 16),
                    Text(
                      widget.title,
                      style: ManosFonts.h2(),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.subtitle,
                      style: ManosFonts.sub1(color: ManosColors.secondary200),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Sobre la actividad",
                      style: ManosFonts.h2(),
                    ),
                    const SizedBox(height: 16),
                    Text(widget.body,
                        style: ManosFonts.b1(color: ManosColors.neutral0)),
                    const SizedBox(height: 16),
                    LocationCard(location: widget.location),
                    const SizedBox(height: 16),
                    Text(widget.location,
                        style: ManosFonts.b1(color: ManosColors.neutral0)),
                    const SizedBox(height: 16),
                    Text(
                      "Participar del voluntariado",
                      style: ManosFonts.h2(),
                    ),
                    const SizedBox(height: 16),
                    Text(widget.requirements,
                        style: ManosFonts.b1(color: ManosColors.neutral0)),
                    const SizedBox(height: 16),
                    const Row(children: [
                      CardChip(amount: 10, isAvailable: true),
                      SizedBox(width: 119),
                    ]),
                    const SizedBox(height: 16),
                    if (_volunteerState == VolunteerState.outState)
                      PrimaryButton(
                          text: "Postularme",
                          onPressedMethod: () => applyToVolunteer())
                    else if (_volunteerState == VolunteerState.pendingState)
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Te has postulado",
                              style: ManosFonts.h2(),
                            ),
                            const SizedBox(height: 8),
                            Text(
                                "Pronto la organización se pondrá en contacto contigo y te inscribirá como participante.",
                                style: ManosFonts.b1()),
                            const SizedBox(height: 8),
                            SecondaryButton(
                                text: "Cancelar postulación",
                                onPressedMethod: () => cancelApplication())
                          ])
                    else if (_volunteerState == VolunteerState.inState)
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Estas participando",
                              style: ManosFonts.h2(),
                            ),
                            const SizedBox(height: 8),
                            Text(
                                "La organización confirmó que ya estas participando de este voluntariado.",
                                style: ManosFonts.b1()),
                            const SizedBox(height: 8),
                            SecondaryButton(
                                text: "Abandonar voluntariado",
                                onPressedMethod: () => cancelApplication())
                          ])
                  ],
                ))));
  }
}
