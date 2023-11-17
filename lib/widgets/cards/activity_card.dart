import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/commons/fonts.dart';
import 'package:equipo_estrella/commons/shadows.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard(
      {Key? key, required this.category, required this.title, required this.id})
      : super(key: key);

  final String id;
  final String category;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: ManosShadows.shadow1.copyWith(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            border: Border.all(color: ManosColors.primary100, width: 2),
            color: ManosColors.primary10),
        height: 73,
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category.toUpperCase(), style: ManosFonts.overline()),
                Text(title, style: ManosFonts.sub1())
              ],
            ),
            const Icon(Icons.location_on,
                color: ManosColors.primary100, size: 24)
          ],
        ));
  }
}
