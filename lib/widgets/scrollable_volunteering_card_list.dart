import 'package:equipo_estrella/providers/volunteering_provider.dart';
import 'package:equipo_estrella/widgets/cards/volunteer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class ScrollableVolunteeringCardList extends ConsumerWidget {
  const ScrollableVolunteeringCardList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final volunteeringList = ref.watch(volunteeringListProvider);

    return volunteeringList.when(
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error: $error'),
      data: (data) {
        return SingleChildScrollView(
          child: Column(
            children:
                data.map((vModel) => VolunteerCard(vModel: vModel)).toList(),
            // Add other widgets to display more data as needed.
          ),
        );
      },
    );
  }
}
