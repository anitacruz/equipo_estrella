import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equipo_estrella/models/volunteering_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:equipo_estrella/models/volunteer_state.dart';

part 'get_volunteering_state_controller.g.dart';

@riverpod
class GetVolunteeringStateController extends _$GetVolunteeringStateController {
  Future<VolunteerState> getVolunteeringState(
      String volId, String userId) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final volunteering = db.collection('volunteering').doc(volId);
    final volunteeringData = await volunteering.get();

    final map = volunteeringData.data() as Map<String, dynamic>;
    final volunteeringToCheck = VolunteeringModel.fromMap(map, volId);

    if (volunteeringToCheck.pending.contains(userId)) {
      return VolunteerState.pendingState;
    } else if (volunteeringToCheck.subscribed.contains(userId)) {
      return VolunteerState.inState;
    } else {
      return VolunteerState.outState;
    }
  }

  @override
  Future<VolunteerState> build() async {
    return VolunteerState.outState;
  }
}
