import 'package:equipo_estrella/controllers/fav_volunteering_controller.dart';
import 'package:flutter/material.dart';
import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/commons/fonts.dart';
import 'package:equipo_estrella/widgets/card_chip.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VolunteerCardDescription extends ConsumerStatefulWidget {
  const VolunteerCardDescription(
      {Key? key,
      required this.id,
      required this.category,
      required this.title,
      required this.vacancies})
      : super(key: key);

  final String id;
  final String category;
  final String title;
  final int vacancies;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VolunteerCardDescriptionState();
}

class _VolunteerCardDescriptionState extends ConsumerState<VolunteerCardDescription> {
  bool _isFav = false;

  void fav() {
    final favVolunteeringProvider =
        ref.watch(favVolunteeringControllerProvider.notifier);

    if (_isFav == true) {
      favVolunteeringProvider.remove("nNu3T0oLg2ir6lpBfKFx", widget.id);
    } else {
      favVolunteeringProvider.add("nNu3T0oLg2ir6lpBfKFx", widget.id);
    }
    setState(() {
      _isFav = !_isFav;
    });
  }

  @override
  Widget build(BuildContext context, ) {
    return Container(
        // width: 1000,
        padding: const EdgeInsets.only(
            left: 16, right: 16, bottom: 16, top: 8), //const EdgeInsets.all(6),
        // margin:
        //     const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 4),
        child: Column(children: [
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                style: ManosFonts.overline(),
                widget.category.toUpperCase(),
              )),
          Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.title,
                    style: ManosFonts.sub1(),
                  ))),
          Container(
              margin: const EdgeInsets.only(top: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardChip(amount: widget.vacancies, isAvailable: true),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                            _isFav ? Icons.favorite : Icons.favorite_border),
                        color: ManosColors.primary100,
                        iconSize: 24,
                        onPressed: () => setState(() {
                          fav();
                        }),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.location_on,
                          color: ManosColors.primary100, size: 24)
                    ],
                  )
                ],
              ))
        ]));
  }
}
