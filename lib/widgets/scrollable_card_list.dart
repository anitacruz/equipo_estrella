import 'package:flutter/material.dart';
import 'volunteer_card.dart';

class ScrollableCardList extends StatelessWidget {
  const ScrollableCardList({super.key});

  //TODO: fix the list divider. Im not sure its actually 24 pixels tall
  //TODO: change it so that it receives a list of cards to display
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return const SizedBox(
              child: VolunteerCard(
            category: "Acción social",
            title: "Un techo para mi país",
          ));
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Colors.transparent,
          height: 0,
        ),
      ),
    );
  }
}

//TODO: sliver -> sirve para tener distintos scrolleables
