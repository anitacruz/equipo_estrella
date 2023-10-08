import 'package:equipo_estrella/widgets/cards/news_card.dart';
import 'package:equipo_estrella/widgets/scrollable_card_list.dart';
import 'package:flutter/material.dart';

class NewsTab extends StatelessWidget {
  const NewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 24, left: 16, right: 16),
        child: const Column(children: [
          ScrollableCardList(
              widgetChild: NewsCard(
                  title: "Juntamos Residuos",
                  subtitle:
                      "Voluntarios de Godoy Cruz, se sumaron a la limpieza de un cauce  en las inmediaciones.",
                  imageUrl: "assets/news_image.png",
                  category: "NOTICIAS DE CUYO")),
        ]));
  }
}
