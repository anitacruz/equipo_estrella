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
      return;
    }

    FirebaseFirestore db = FirebaseFirestore.instance;
    final doc = db.collection("users").doc(currUserId);
    final data = await doc.get();

    final map = data.data() as Map<String, dynamic>;
    _currUser = UserModel.fromMap(map, currUserId);
  }

  @override
  Future<UserModel> build() async {
    await refresh();
    return _currUser!;
  }

  Future<UserModel> getCurrUser() async {
    if (_currUser == null) {
      await refresh();
    }
    return _currUser!; 
  }

  Future<void> updateUser(UserModel user) async {
    //takes the user and updates the firebase database
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docRef = db.collection("users").doc(user.id);
    await docRef.update(user.toJson());
    _currUser = user;
  }

  // Future<void> updateCurrUser(UserModel user) async {
  //   FirebaseFirestore db = FirebaseFirestore.instance;
  //   final docRef = db.collection("users").doc(user.id);
  //   await docRef.update(user.toJson());
  //   await refresh();
  // }

  Future<UserModel> getById(String id) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final user = db.collection("users").doc(id);
    return user.get().then(
        (value) => UserModel.fromMap(value.data() as Map<String, dynamic>, id));
  }

  void when(
      {required Null Function(dynamic data) data,
      required Map loading,
      required Map error}) {}
}
