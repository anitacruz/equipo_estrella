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

    for (var volunteering in volunteeringsList) {
      logger.i(volunteering.toJson());
    }

    return volunteeringsList;
  }

  Future<void> subscribe(String volunteeringId, String userId) async {
    logger.i("Subscribing user $userId to volunteering $volunteeringId");
    FirebaseFirestore db = FirebaseFirestore.instance;

    DocumentReference volunteeringRef =
        db.collection("volunteering").doc(volunteeringId);
    await db.runTransaction((transaction) async {
      DocumentSnapshot volunteeringSnapshot =
          await transaction.get(volunteeringRef);

      logger.i(volunteeringSnapshot.data());

      if (volunteeringSnapshot.exists && volunteeringSnapshot.data() != null) {
        List<dynamic>? currentSubscribed =
            volunteeringSnapshot.data() as List<dynamic>?;
        if (!currentSubscribed!.contains(userId)) {
          currentSubscribed.add(userId);
          logger.i(currentSubscribed);
          transaction
              .update(volunteeringRef, {'subscribed': currentSubscribed});
        }
      }
    });
  }
}
