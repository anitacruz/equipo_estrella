import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equipo_estrella/models/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:logger/logger.dart';

part 'fav_volunteering_controller.g.dart';

var logger = Logger();

@riverpod
class FavVolunteeringController extends _$FavVolunteeringController {
  Future<void> add(String userId, String volunteeringId) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final users = db.collection("users").doc(userId);
    var userData = await users.get();

    final map = userData.data() as Map<String, dynamic>;

    final userUpdate = UserModel.fromMap(map, userId);

    if (!userUpdate.favVolunteerings.contains(volunteeringId)) {
      userUpdate.favVolunteerings.add(volunteeringId);
      await db.collection("users").doc(userId).update(userUpdate.toJson());
    }
  }

  Future<void> remove(String userId, String volunteeringId) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final users = db.collection("users").doc(userId);
    var userData = await users.get();

    final map = userData.data() as Map<String, dynamic>;

    final userUpdate = UserModel.fromMap(map, userId);

    if (userUpdate.favVolunteerings.contains(volunteeringId)) {
      userUpdate.favVolunteerings.remove(volunteeringId);
      await db.collection("users").doc(userId).update(userUpdate.toJson());
    }
  }

  @override
  Future<void> build() async {}
}
