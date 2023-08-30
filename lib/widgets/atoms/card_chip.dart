import 'package:flutter/material.dart';

class CardChip extends StatelessWidget {
  const CardChip(
      {Key? key, required this.label, required this.icon, required this.value})
      : super(key: key);

  final String label;
  final IconData icon;
  final int value;

  //TODO: make it accept class props
  @override
  Widget build(BuildContext context) {
    return const Chip(
        label: Row(
      children: [
        Text("Vacantes:"),
        SizedBox(width: 15),
        Icon(Icons.person),
        Text("10")
      ],
    ));
  }
}
