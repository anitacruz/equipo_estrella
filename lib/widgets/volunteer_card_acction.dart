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
                backgroundColor: Color.fromARGB(255, 202, 229, 251),
                // selectedColor: Color.fromARGB(255, 202, 229, 251),
                // selected: true,
                labelStyle: TextStyle(color: Color.fromARGB(255, 13, 71, 161)),
                label: Row(
                  children: [
                    Text("Vacantes:"),
                    SizedBox(width: 15),
                    Icon(Icons.person,
                        color: Color.fromARGB(255, 13, 71, 161), size: 24),
                    Text("10")
                  ],
                )),
            Row(
              children: [
                Icon(
                  Icons.favorite_border,
                  color: Color.fromARGB(255, 20, 144, 63),
                ),
                SizedBox(width: 16),
                Icon(Icons.location_on,
                    color: Color.fromARGB(255, 20, 144, 63), size: 24)
              ],
            )
          ],
        ));
  }
}
