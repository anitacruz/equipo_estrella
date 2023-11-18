import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equipo_estrella/models/volunteering_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:logger/logger.dart';

part 'volunteering_controller.g.dart';

var logger = Logger();

@riverpod
class VolunteeringController extends _$VolunteeringController {
  @override
  Future<List<VolunteeringModel>> build() {
    // logger.i("Building VolunteeringController");
    return getVolunteeringList();
  }

  Future<List<VolunteeringModel>> getVolunteeringList(
      {String? searchQuery}) async {
    logger.i("Getting volunteering list with SEARCH QUERY===${searchQuery}");
    FirebaseFirestore db = FirebaseFirestore.instance;
    final volunteerings = await db.collection("volunteerings").get();
    final volunteeringsList = volunteerings.docs.map((doc) {
      final id = doc.id;
      final data = doc.data();
      return VolunteeringModel.fromMap(data, id);
    }).toList();
    if (searchQuery != null && searchQuery.isNotEmpty) {
      return volunteeringsList
          .where((element) => element.title
              .toLowerCase()
              .trim()
              .contains(searchQuery.toLowerCase().trim()))
          .toList();
    }

    return volunteeringsList;
  }

  Future<VolunteeringModel> getVolunteering(String id) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final volunteering = db.collection("volunteerings").doc(id);
    final data = (await volunteering.get()).data();
    return VolunteeringModel.fromMap(data!, id);
  }
}
