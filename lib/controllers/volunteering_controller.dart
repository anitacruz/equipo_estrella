import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equipo_estrella/models/volunteering_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:logger/logger.dart';

var logger = Logger();

@riverpod
class VolunteeringController {
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

  Future<VolunteeringModel> apply(String volId, String userId) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final volunteering = await db.collection("volunteerings").doc(volId).get();
    final map = volunteering.data() as Map<String, dynamic>;
    final volunteeringUpdate = VolunteeringModel.fromMap(map, volId);

    if (volunteeringUpdate.pending.contains(userId)) {
      volunteeringUpdate.pending.remove(userId);
    } else {
      volunteeringUpdate.pending.add(userId);
    }

    await db
        .collection("volunteerings")
        .doc(volId)
        .update(volunteeringUpdate.toJson());

    return volunteeringUpdate;
  }
}
