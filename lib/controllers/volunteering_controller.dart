import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equipo_estrella/models/volunteering_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

@riverpod
class VolunteeringController {
  Future<List<VolunteeringModel>> getVolunteeringList() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final volunteerings = await db.collection("volunteering").get();
    final volunteeringsList =
        volunteerings.docs.map((doc) => doc.data()).toList();
    return volunteeringsList.map((e) => VolunteeringModel.fromMap(e)).toList();
  }
}
