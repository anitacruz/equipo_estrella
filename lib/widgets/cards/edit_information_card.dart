import 'package:flutter/material.dart';

import '../../commons/colors.dart';
import '../../commons/fonts.dart';

class EditInformationCard extends StatefulWidget {
  final String title;

  const EditInformationCard({Key? key, required this.title}) : super(key: key);

  @override
  EditInformationCardState createState() => EditInformationCardState();
}

class EditInformationCardState extends State<EditInformationCard> {
  String selectedOption = '';

  void selectOption(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  Widget buildOption(String optionText) {
    final String imagePath = selectedOption == optionText
        ? 'assets/radio_button_checked.png'
        : 'assets/radio_button_unchecked.png';

    return InkWell(
      onTap: () => selectOption(optionText),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 24,
            height: 24,
            color: selectedOption == optionText
                ? ManosColors.primary100
                : Colors.transparent,
          ),
          const SizedBox(width: 8),
          Text(
            optionText,
            style: ManosFonts.b1(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      alignment: Alignment.center,
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
              widget.title,
              style: ManosFonts.sub1(),
            ),
          ),
          Container(
            width: 1000,
            padding:
                const EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
              color: ManosColors.neutral10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => selectOption("Hombre"),
                  child: buildOption("Hombre"),
                ),
                const SizedBox(height: 8),
                InkWell(
                  onTap: () => selectOption("Mujer"),
                  child: buildOption("Mujer"),
                ),
                const SizedBox(height: 8),
                InkWell(
                  onTap: () => selectOption("No binario"),
                  child: buildOption("No binario"),
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
