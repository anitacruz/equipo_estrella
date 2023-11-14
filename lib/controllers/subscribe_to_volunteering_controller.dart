import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equipo_estrella/models/volunteering_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:logger/logger.dart';

part 'subscribe_to_volunteering_controller.g.dart';

var logger = Logger();

@riverpod
class SubscribeToVolunteeringController
    extends _$SubscribeToVolunteeringController {
  Future<void> subscribe(String volId, String userId) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final volunteering = db.collection("volunteering").doc(volId);
    var volunteeringData = await volunteering.get();

    final map = volunteeringData.data() as Map<String, dynamic>;
    final volunteeringUpdate = VolunteeringModel.fromMap(map, volId);

    if (!volunteeringUpdate.subscribed.contains(userId) && !volunteeringUpdate.pending.contains(userId)) {
      volunteeringUpdate.pending.add(userId);
      await db
          .collection("volunteering")
          .doc(volId)
          .update(volunteeringUpdate.toJson());
    }
  }

  @override
  Future<void> build() async {}
}
