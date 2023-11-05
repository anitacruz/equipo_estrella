import 'package:equipo_estrella/widgets/scrollable_news_card_list.dart';
import 'package:flutter/material.dart';

class NewsTab extends StatelessWidget {
  const NewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 24, left: 16, right: 16),
        child: const ScrollableNewsCardList());
  }
}
