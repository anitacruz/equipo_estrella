import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equipo_estrella/models/user_model.dart';
import 'package:equipo_estrella/models/volunteering_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:equipo_estrella/models/volunteer_state.dart';

part 'get_volunteering_state_controller.g.dart';

@riverpod
class GetVolunteeringStateController extends _$GetVolunteeringStateController {
  Future<VolunteerState> getVolunteeringState(
      String volId, UserModel user) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final volunteering = db.collection('volunteerings').doc(volId);
    final volunteeringData = await volunteering.get();

    final map = volunteeringData.data() as Map<String, dynamic>;
    final volunteeringToCheck = VolunteeringModel.fromMap(map, volId);

    if (user.currVolunteering != "" && user.currVolunteering != volId) {
      return VolunteerState.alreadyInOneState;
    }

    if (volunteeringToCheck.pending.contains(user.id)) {
      return VolunteerState.pendingState;
    }
    if (volunteeringToCheck.subscribed.contains(user.id)) {
      return VolunteerState.inState;
    }
    return VolunteerState.outState;
  }

  @override
  Future<VolunteerState> build() async {
    return VolunteerState.outState;
  }
}
