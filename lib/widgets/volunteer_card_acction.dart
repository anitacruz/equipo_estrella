import 'package:equipo_estrella/colors.dart';
import 'package:equipo_estrella/widgets/atoms/card_chip.dart';
import 'package:flutter/material.dart';

class VolunteerCardAction extends StatelessWidget {
  const VolunteerCardAction({super.key});

  //TODO: add icon builder
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 4),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardChip(amount: 10, isAvailable: false),
            Row(
              children: [
                Icon(
                  Icons.favorite_border,
                  color: ManosColors.primary100,
                ),
                SizedBox(width: 16),
                Icon(Icons.location_on, color: ManosColors.primary100, size: 24)
              ],
            )
          ],
        ));
  }
}
