import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/widgets/scrollable_card_list.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 24, left: 16, right: 16),
        child: const Column(children: [
          TextField(
            decoration: InputDecoration(
                // border: OutlineInputBorder(),
                labelText: 'Buscar',
                prefixIcon: Icon(Icons.search, size: 24),
                suffixIcon:
                    Icon(Icons.map, size: 24, color: ManosColors.primary100)),
          ),
          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 24),
              child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "Voluntariados",
                    style: TextStyle(fontSize: 24),
                  ))),
          // Expanded(child: NoVolunteerCard())
          ScrollableCardList(),
        ]));
  }
}
