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
    logger.i("Building VolunteeringController");
    return getVolunteeringList();
  }

  Future<List<VolunteeringModel>> getVolunteeringList() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final volunteerings = await db.collection("volunteering").get();
    final volunteeringsList = volunteerings.docs.map((doc) {
      final id = doc.id;
      final data = doc.data();
      return VolunteeringModel.fromMap(data, id);
    }).toList();

    return volunteeringsList;
  }
}
