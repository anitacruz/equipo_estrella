import 'package:equipo_estrella/commons/fonts.dart';
import 'package:flutter/material.dart';

import '../../commons/colors.dart';

class InformationCard extends StatelessWidget {
  final String title;
  final String subtitle1;
  final String subtitle2;
  final String value1;
  final String value2;
  const InformationCard(
      {Key? key,
      required this.title,
      required this.subtitle1,
      required this.subtitle2,
      required this.value1,
      required this.value2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 1000,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
              color: ManosColors.secondary25,
            ),
            child: Text(
              title,
              style: ManosFonts.sub1(),
            ),
          ),
          Container(
            width: 1000,
            padding: const EdgeInsets.only(left: 16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
              color: ManosColors.neutral10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  subtitle1,
                  style: ManosFonts.overline(color: ManosColors.neutral75),
                ),
                Text(
                  value1,
                  style: ManosFonts.b1(),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle2,
                  style: ManosFonts.overline(color: ManosColors.neutral75),
                ),
                Text(
                  value2,
                  style: ManosFonts.b1(),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
