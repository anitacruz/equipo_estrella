import 'package:flutter/material.dart';
import 'volunteer_card.dart';

class ScrollableCardList extends StatelessWidget {
  const ScrollableCardList({super.key});

  //TODO: fix the list divider. Im not sure its actually 24 pixels tall
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return const SizedBox(
            child: VolunteerCard(),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Colors.transparent,
          height: 0,
        ),
      ),
    );
  }
}
