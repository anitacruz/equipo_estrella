import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/commons/shadows.dart';
import 'package:equipo_estrella/controllers/volunteering_controller.dart';
import 'package:equipo_estrella/views/expanded_volunteering.dart';
import 'package:equipo_estrella/widgets/cards/volunteer_card_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class ScrollableVolunteeringCardList extends ConsumerWidget {
  const ScrollableVolunteeringCardList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final volunteeringList = ref.watch(volunteeringControllerProvider);

    return volunteeringList.when(
      loading: () => const SizedBox(
          width: 10,
          height: 10,
          child: CircularProgressIndicator(
            color: ManosColors.primary100,
          )),
      error: (error, stackTrace) => Text('Error: $error'),
      data: (data) {
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final vModel = data[index];
            return InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExpandedVolunteer(
                    vModel: vModel,
                  ),
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 24),
                decoration: ManosShadows.shadow1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.network(
                      vModel.imageUrl,
                      height: 138,
                      fit: BoxFit.cover,
                    ),
                    VolunteerCardDescription(
                      id: vModel.id,
                      category: vModel.category,
                      title: vModel.title,
                      vacancies: (vModel.vacancies - vModel.pending.length),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
