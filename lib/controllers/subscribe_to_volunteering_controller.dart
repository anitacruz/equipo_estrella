import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equipo_estrella/models/user_model.dart';
import 'package:equipo_estrella/models/volunteering_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:logger/logger.dart';

part 'subscribe_to_volunteering_controller.g.dart';

var logger = Logger();

@riverpod
class SubscribeToVolunteeringController
    extends _$SubscribeToVolunteeringController {
  Future<void> subscribe(String volId, String userId) async {
    // var userId = FirebaseAuth.instance.currentUser?.uid;

    FirebaseFirestore db = FirebaseFirestore.instance;
    final volunteering = db.collection("volunteerings").doc(volId);
    var volunteeringData = await volunteering.get();

    final map = volunteeringData.data() as Map<String, dynamic>;
    final volunteeringUpdate = VolunteeringModel.fromMap(map, volId);

    if (!volunteeringUpdate.subscribed.contains(userId) &&
        !volunteeringUpdate.pending.contains(userId)) {
      volunteeringUpdate.pending.add(userId);
      await db
          .collection("volunteerings")
          .doc(volId)
          .update(volunteeringUpdate.toJson());
    }

    // Update user currVolunteering
    final user = db.collection("users").doc(userId);
    var userData = await user.get();

    final userMap = userData.data() as Map<String, dynamic>;
    final userUpdate = UserModel.fromMap(userMap, userId);

    userUpdate.currVolunteering = volId;

    await db.collection("users").doc(userId).update(userUpdate.toJson());

    logger.i("User subscribed to volunteering");
  }

  @override
  Future<void> build() async {}
}
