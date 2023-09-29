import 'package:flutter/material.dart';
import 'package:equipo_estrella/commons/colors.dart';

import '../commons/fonts.dart';

class CardChip extends StatelessWidget {
  const CardChip({Key? key, required this.amount, required this.isAvailable})
      : super(key: key);

  final int amount;
  final bool isAvailable;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 28,
        // alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color:
              //#CAE5FB
              isAvailable ? ManosColors.secondary25 : ManosColors.neutral25,
        ),
        // color:
        //     isAvailable ? ManosColors.secondary80 : ManosColors.neutral25,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Vacantes:",
                style: ManosFonts.b2(color: ManosColors.neutral0)),
            const SizedBox(width: 8),
            Icon(Icons.person,
                size: 20,
                color: isAvailable
                    ? ManosColors.secondary200
                    : ManosColors.secondary80),
            Text('$amount',
                style: ManosFonts.b1(
                    color: isAvailable
                        ? ManosColors.secondary200
                        : ManosColors.secondary80)),
          ],
        ));
  }
}
