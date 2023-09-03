import 'package:flutter/material.dart';
import '../../colors.dart';

class CardChip extends StatelessWidget {
  const CardChip({Key? key, required this.amount, required this.isAvailable})
      : super(key: key);

  final int amount;
  final bool isAvailable;
  @override
  Widget build(BuildContext context) {
    return Chip(
        backgroundColor:
            isAvailable ? ManosColors.secondary80 : ManosColors.neutral25,
        // labelStyle: TextStyle(color: ManosColors.secondary200),
        label: Row(
          children: [
            Text("Vacantes:",
                style: TextStyle(
                    color: isAvailable
                        ? ManosColors.secondary200
                        : ManosColors.neutral0)),
            const SizedBox(width: 15),
            Icon(Icons.person,
                color: isAvailable
                    ? ManosColors.secondary200
                    : ManosColors.secondary80,
                size: 24),
            Text('$amount',
                style: TextStyle(
                    color: isAvailable
                        ? ManosColors.secondary200
                        : ManosColors.secondary80))
          ],
        ));
  }
}
