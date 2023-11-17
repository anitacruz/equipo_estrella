import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equipo_estrella/models/volunteering_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:logger/logger.dart';

part 'unsubscribe_to_volunteering_controller.g.dart';

var logger = Logger();

@riverpod
class UnsubscribeToVolunteeringController
    extends _$UnsubscribeToVolunteeringController {
  Future<void> unsubscribe(String volId, String userId) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final volunteering = db.collection("volunteerings").doc(volId);
    var volunteeringData = await volunteering.get();

    final map = volunteeringData.data() as Map<String, dynamic>;
    final volunteeringUpdate = VolunteeringModel.fromMap(map, volId);

    if (volunteeringUpdate.pending.contains(userId)) {
      volunteeringUpdate.pending.remove(userId);
    } else if (volunteeringUpdate.subscribed.contains(userId)) {
      volunteeringUpdate.subscribed.remove(userId);
    }
    await db
        .collection("volunteerings")
        .doc(volId)
        .update(volunteeringUpdate.toJson());
  }

  @override
  Future<void> build() async {}
}
