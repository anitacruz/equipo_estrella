import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/controllers/news_controller.dart';
import 'package:equipo_estrella/widgets/cards/news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScrollableNewsCardList extends ConsumerWidget {
  const ScrollableNewsCardList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsList = ref.watch(newsControllerProvider);

    return newsList.when(
      loading: () => const Center(
        child: SizedBox(
          width: 24.0, // Adjust the size as needed
          height: 24.0, // Adjust the size as needed
          child: CircularProgressIndicator(
            color: ManosColors.primary100,
          ),
        ),
      ),
      error: (error, stackTrace) => Text('Error: $error'),
      data: (data) {
        return SingleChildScrollView(
          child: Column(
            children: data.map((nModel) => NewsCard(nModel: nModel)).toList(),
            // Add other widgets to display more data as needed.
          ),
        );
      },
    );
  }
}
