import 'package:flutter/material.dart';
import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/commons/fonts.dart';
import 'package:equipo_estrella/widgets/card_chip.dart';

class VolunteerCardDescription extends StatefulWidget {
  const VolunteerCardDescription(
      {Key? key,
      required this.category,
      required this.title,
      required this.vacancies})
      : super(key: key);

  final String category;
  final String title;
  final int vacancies;

  @override
  State<StatefulWidget> createState() => _VolunteerCardDescriptionState();
}

class _VolunteerCardDescriptionState extends State<VolunteerCardDescription> {
  bool _isFav = false;

  void fav() {
    setState(() {
      _isFav = !_isFav;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                          _isFav = !_isFav;
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
