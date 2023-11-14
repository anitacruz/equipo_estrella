import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equipo_estrella/models/users_model.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

var logger = Logger();

@riverpod
class UserController {
  Future<UsersModel> favoriteVolunteering(
      String volunteeringId, String userId) async {
    logger.i("User $userId favoriting volunteering $volunteeringId");

    FirebaseFirestore db = FirebaseFirestore.instance;
    final user = await db.collection("users").doc(userId).get();
    final map = user.data() as Map<String, dynamic>;
    final userUpdate = UsersModel.fromMap(map, userId);

    if (userUpdate.favoriteVolunteerings.contains(volunteeringId)) {
      userUpdate.favoriteVolunteerings.remove(volunteeringId);
    } else {
      userUpdate.favoriteVolunteerings.add(volunteeringId);
    }

    await db.collection("users").doc(userId).update(userUpdate.toJson());

    return userUpdate;
  }
}
