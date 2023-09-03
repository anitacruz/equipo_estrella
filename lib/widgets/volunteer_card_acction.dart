import 'package:equipo_estrella/colors.dart';
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
            Chip(
                backgroundColor: ManosColors.secondary25,
                // selectedColor: Color.fromARGB(255, 202, 229, 251),
                // selected: true,
                labelStyle: TextStyle(color: ManosColors.secondary200),
                label: Row(
                  children: [
                    Text("Vacantes:"),
                    SizedBox(width: 15),
                    Icon(Icons.person,
                        color: ManosColors.secondary200, size: 24),
                    Text("10")
                  ],
                )),
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
