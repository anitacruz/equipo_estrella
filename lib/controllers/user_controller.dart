import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equipo_estrella/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_controller.g.dart';

var logger = Logger();

@riverpod
class UserController extends _$UserController {
  UserModel? _currUser;

  Future<void> refresh() async {
    var currUserId = FirebaseAuth.instance.currentUser?.uid;

    if (currUserId == null) {
      logger.e("User not logged in");
    }

    FirebaseFirestore db = FirebaseFirestore.instance;
    final docRef = db.collection("users").doc(currUserId);
    docRef.snapshots().listen((event) {
      _currUser =
          UserModel.fromMap(event.data() as Map<String, dynamic>, currUserId);
    });
  }

  @override
  Future<void> build() async {
    await refresh();
  }

  Future<UserModel> getCurrUser() async {
    return _currUser!; //TODO: check if null
  }

  Future<UserModel> getById(String id) {

    FirebaseFirestore db = FirebaseFirestore.instance;
    final user = db.collection("users").doc(id);
    return user.get().then(
        (value) => UserModel.fromMap(value.data() as Map<String, dynamic>, id));
  }
}
