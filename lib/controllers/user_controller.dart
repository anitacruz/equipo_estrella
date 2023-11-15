import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equipo_estrella/models/user_model.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_controller.g.dart';

var logger = Logger();

@riverpod
class UserController extends _$UserController {
  @override
  Future<void> build() async {}

  Future<UserModel> getById(String id) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final user = db.collection("users").doc(id);
    return user.get().then(
        (value) => UserModel.fromMap(value.data() as Map<String, dynamic>, id));
  }
}
