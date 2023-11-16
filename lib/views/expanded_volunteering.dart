import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/commons/fonts.dart';
import 'package:equipo_estrella/commons/shadows.dart';
import 'package:equipo_estrella/controllers/get_volunteering_state_controller.dart';
import 'package:equipo_estrella/controllers/subscribe_to_volunteering_controller.dart';
import 'package:equipo_estrella/controllers/unsubscribe_to_volunteering_controller.dart';
import 'package:equipo_estrella/controllers/volunteering_controller.dart';
import 'package:equipo_estrella/models/volunteering_model.dart';
import 'package:equipo_estrella/widgets/buttons/primary_button.dart';
import 'package:equipo_estrella/widgets/buttons/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/volunteer_state.dart';
import '../widgets/card_chip.dart';
import '../widgets/cards/location_card.dart';

class ExpandedVolunteer extends ConsumerStatefulWidget {
  const ExpandedVolunteer({
    Key? key,
    required this.vModel,
  }) : super(key: key);

  final VolunteeringModel vModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ExpandedVolunteerState();
}

var logger = Logger();

class _ExpandedVolunteerState extends ConsumerState<ExpandedVolunteer> {
  VolunteerState? _volunteerState;

  @override
  void initState() {
    super.initState();
    var getVolunteeringStateController =
        ref.read(getVolunteeringStateControllerProvider.notifier);
    getVolunteeringStateController
        .getVolunteeringState(widget.vModel.id, "userId")
        .then((value) => {
              if (mounted)
                {
                  setState(() {
                    _volunteerState = value;
                  })
                }
            });
  }

  void subscribeToVolunteer(
      BuildContext context, WidgetRef ref, String id) async {
    final subscribeToVolunteering =
        ref.read(subscribeToVolunteeringControllerProvider.notifier);

    //TODO: if volunteer has no data -> go to profile
    subscribeToVolunteering
        .subscribe(id, "userId")
        .then((value) => {logger.i("Applied to volunteering")})
        .whenComplete(() => setState(() {
              _volunteerState = VolunteerState.pendingState;
              widget.vModel.pending.add("userId");
            }));
  }

  void cancelApplication() async {
    final unsubscribeToVolunteering =
        ref.read(unsubscribeToVolunteeringControllerProvider.notifier);

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              // width: 218, // Set the fixed width here
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: ManosShadows.shadow2.copyWith(
                  borderRadius: const BorderRadius.all(Radius.circular(4))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "¿Estás seguro de que quieres cancelar tu postulación?",
                      style: ManosFonts.sub1(),
                    ),
                    Text(widget.vModel.title, style: ManosFonts.h2()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SecondaryButton(
                          text: "Cancelar",
                          onPressedMethod: () => Navigator.of(context).pop(),
                          block: false,
                        ),
                        SecondaryButton(
                          text: "Confirmar",
                          block: false,
                          onPressedMethod: () {
                            unsubscribeToVolunteering
                                .unsubscribe(widget.vModel.id, "userId")
                                .then((value) =>
                                    {logger.i("Unsubscribed from volunteer")})
                                .whenComplete(() => {
                                      if (mounted)
                                        {
                                          setState(() {
                                            _volunteerState =
                                                VolunteerState.outState;
                                            widget.vModel.pending
                                                .remove("userId");
                                            Navigator.of(context).pop();
                                          })
                                        }
                                    });
                          },
                        ),
                      ],
                    )
                  ]));
        });

    //TODO: fix to display in the middle of the screen
  }

  @override
  Widget build(BuildContext context) {
    final volunteeringProvider =
        ref.watch(volunteeringControllerProvider.notifier);

    volunteeringProvider.getVolunteering(widget.vModel.id).then((value) => {
          if (value.pending.contains("userId"))
            {
              setState(() {
                _volunteerState = VolunteerState.pendingState;
              })
            }
          else if (value.subscribed.contains("userId"))
            {
              setState(() {
                _volunteerState = VolunteerState.inState;
              })
            }
        });

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: ManosColors.neutral100,
            onPressed: () => Navigator.pop(context),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  widget.vModel.imageUrl,
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
                    Text(widget.vModel.category,
                        style:
                            ManosFonts.overline(color: ManosColors.neutral0)),
                    const SizedBox(height: 16),
                    Text(
                      widget.vModel.title,
                      style: ManosFonts.h2(),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.vModel.subtitle,
                      style: ManosFonts.sub1(color: ManosColors.secondary200),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Sobre la actividad",
                      style: ManosFonts.h2(),
                    ),
                    const SizedBox(height: 16),
                    Text(widget.vModel.body,
                        style: ManosFonts.b1(color: ManosColors.neutral0)),
                    const SizedBox(height: 16),
                    LocationCard(location: widget.vModel.location),
                    const SizedBox(height: 16),
                    Text(
                      "Participar del voluntariado",
                      style: ManosFonts.h2(),
                    ),
                    const SizedBox(height: 16),
                    Text(widget.vModel.requirements,
                        style: ManosFonts.b1(color: ManosColors.neutral0)),
                    const SizedBox(height: 16),
                    Text(widget.vModel.availability,
                        style: ManosFonts.b1(color: ManosColors.neutral0)),
                    const SizedBox(height: 16),
                    Row(children: [
                      CardChip(
                          amount: widget.vModel.vacancies -
                              widget.vModel.pending.length,
                          isAvailable: true),
                      const SizedBox(width: 119),
                    ]),
                    const SizedBox(height: 16),
                    if (widget.vModel.vacancies == 0)
                      Column(children: [
                        Text(
                          "No hay vacantes disponibles para postularse",
                          style: ManosFonts.b1(color: ManosColors.neutral0),
                        ),
                        const SizedBox(height: 16),
                        PrimaryButton(
                            text: "Postularme",
                            disabled: true,
                            onPressedMethod: () => {})
                      ])
                    else if (_volunteerState == VolunteerState.outState)
                      PrimaryButton(
                          text: "Postularme",
                          onPressedMethod: () => subscribeToVolunteer(
                              context, ref, widget.vModel.id)) //TODO
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
