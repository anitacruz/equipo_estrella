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

  Future<void> subscribe(String volunteeringId, String userId) async {
    logger.i("Subscribing user $userId to volunteering $volunteeringId");
    FirebaseFirestore db = FirebaseFirestore.instance;

    // Get the volunteering document by ID
    DocumentReference volunteeringRef =
        db.collection("volunteering").doc(volunteeringId);

    // Use a transaction to update the "subscribed" array
    await db.runTransaction((transaction) async {
      DocumentSnapshot volunteeringSnapshot =
          await transaction.get(volunteeringRef);

      logger.i(volunteeringSnapshot.data());

      // Check if the volunteering document exists and has data
      if (volunteeringSnapshot.exists && volunteeringSnapshot.data() != null) {
        // Get the current subscribed array
        List<dynamic>? currentSubscribed =
            volunteeringSnapshot.data() as List<dynamic>?;

        // Check if the userId is not already in the subscribed array
        if (!currentSubscribed!.contains(userId)) {
          // Append the userId to the subscribed array
          currentSubscribed.add(userId);

          logger.i(currentSubscribed);

          // Update the "subscribed" array in the volunteering document
          transaction
              .update(volunteeringRef, {'subscribed': currentSubscribed});
        }
      }
    });
  }
}
