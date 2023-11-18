import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/commons/shadows.dart';
import 'package:equipo_estrella/controllers/volunteering_controller.dart';
import 'package:equipo_estrella/models/volunteering_model.dart';
import 'package:equipo_estrella/views/expanded_volunteering.dart';
import 'package:equipo_estrella/widgets/cards/volunteer_card_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class ScrollableVolunteeringCardList extends ConsumerWidget {
  const ScrollableVolunteeringCardList({
    Key? key,
    required String? this.searchQuery,
  }) : super(key: key);
  final String? searchQuery;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (searchQuery == null || searchQuery!.isEmpty) {
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

    final volunteeringMethods =
        ref.read(volunteeringControllerProvider.notifier);
    //if searchQuery is not null, we need to return a ""
    final validSearchQuery = searchQuery ?? "";
    final voluteeringFilteredList =
        volunteeringMethods.getVolunteeringList(searchQuery: validSearchQuery);
    return FutureBuilder<List<VolunteeringModel>>(
        future: voluteeringFilteredList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(
                width: 10,
                height: 10,
                child: CircularProgressIndicator(
                  color: ManosColors.primary100,
                ));
          } else if (snapshot.hasError) {
            // Si hay un error, mostramos un mensaje de error
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final vModel = snapshot.data![index];
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
          }
        });
  }
}
