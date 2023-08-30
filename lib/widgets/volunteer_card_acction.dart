import 'package:flutter/material.dart';

class VolunteerCardAction extends StatelessWidget {
  const VolunteerCardAction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Chip(
            label: Row(
          children: [
            Text("Vacantes:"),
            SizedBox(width: 15),
            Icon(Icons.person),
            Text("10")
          ],
        )),
        Row(
          children: [
            Icon(
              Icons.favorite_border,
              color: Colors.lightBlue,
            ),
            SizedBox(width: 10),
            Icon(
              Icons.location_on,
              color: Colors.lightBlue,
            )
          ],
        )
      ],
    );
  }
}
