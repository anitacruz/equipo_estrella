import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/commons/fonts.dart';
import 'package:equipo_estrella/commons/shadows.dart';
import 'package:equipo_estrella/controllers/subscribe_to_volunteering_controller.dart';
import 'package:equipo_estrella/controllers/unsubscribe_to_volunteering_controller.dart';
import 'package:equipo_estrella/widgets/buttons/primary_button.dart';
import 'package:equipo_estrella/widgets/buttons/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/card_chip.dart';
import '../widgets/cards/location_card.dart';

enum VolunteerState {
  inState,
  outState,
  pendingState,
}

class ExpandedVolunteer extends ConsumerStatefulWidget {
  const ExpandedVolunteer(
      {Key? key,
      required this.id,
      required this.category,
      required this.title,
      required this.imageUrl,
      required this.subtitle,
      required this.body,
      required this.requirements,
      required this.location,
      required this.vacancies,
      required this.availability})
      : super(key: key);

  final String id;
  final String category;
  final String title;
  final String imageUrl;
  final String subtitle;
  final String body;
  final String requirements;
  final String location;
  final String availability;
  final int vacancies;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ExpandedVolunteerState();
}

var logger = Logger();

class _ExpandedVolunteerState extends ConsumerState<ExpandedVolunteer> {
  VolunteerState _volunteerState = VolunteerState.outState;

  void subscribeToVolunteer(BuildContext context, WidgetRef ref, String id) {
    final subscribeToVolunteering =
        ref.read(subscribeToVolunteeringControllerProvider.notifier);

    subscribeToVolunteering
        .subscribe(id, "userId")
        .then((value) => {logger.i("Applied to volunteer")})
        .whenComplete(() => setState(() {
              _volunteerState = VolunteerState.pendingState;
            }));

    // }) .when(data: (volunteering) {
    //   logger.i("Applied to volunteer");
    //   setState(() {
    //     _volunteerState = VolunteerState.pendingState;
    //   });
    // }, loading: () {
    //   logger.i("Loading");
    // }, error: (error, stackTrace) {
    //   logger.e("Error");
    // });
  }

  void cancelApplication() {
    final unsubscribeToVolunteering =
        ref.read(unsubscribeToVolunteeringControllerProvider.notifier);

    unsubscribeToVolunteering
        .unsubscribe(widget.id, "userId")
        .then((value) => {logger.i("Unsubscribed from volunteer")})
        .whenComplete(() => setState(() {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                        // width: 218, // Set the fixed width here
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 24),
                        decoration: ManosShadows.shadow2.copyWith(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4))),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "¿Estás seguro de que quieres cancelar tu postulación?",
                                style: ManosFonts.sub1(),
                              ),
                              Text(widget.title, style: ManosFonts.h2()),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SecondaryButton(
                                    text: "Cancelar",
                                    onPressedMethod: () =>
                                        Navigator.of(context).pop(),
                                    block: false,
                                  ),
                                  SecondaryButton(
                                    text: "Confirmar",
                                    block: false,
                                    onPressedMethod: () {
                                      Navigator.of(context).pop();
                                      setState(() {
                                        _volunteerState =
                                            VolunteerState.outState;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ]));
                  });
            }));

    //TODO: fix to display in the middle of the screen
  }

  void acceptApplication() {
    setState(() {
      _volunteerState = VolunteerState.inState;
      //call volunteering controller subscribe method through volunteering provider
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
                image: NetworkImage(
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
                    Text(
                      "Participar del voluntariado",
                      style: ManosFonts.h2(),
                    ),
                    const SizedBox(height: 16),
                    Text(widget.requirements,
                        style: ManosFonts.b1(color: ManosColors.neutral0)),
                    const SizedBox(height: 16),
                    Text(widget.availability,
                        style: ManosFonts.b1(color: ManosColors.neutral0)),
                    const SizedBox(height: 16),
                    Row(children: [
                      CardChip(amount: widget.vacancies, isAvailable: true),
                      const SizedBox(width: 119),
                    ]),
                    const SizedBox(height: 16),
                    if (_volunteerState == VolunteerState.outState)
                      PrimaryButton(
                          text: "Postularme",
                          onPressedMethod: () => subscribeToVolunteer(
                              context, ref, widget.id)) //TODO
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
