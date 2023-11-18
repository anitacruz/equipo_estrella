import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'upload_image_controller.g.dart';

var logger = Logger();

@riverpod
class UploadImageController extends _$UploadImageController {
  @override
  Future<void> build() async {}

  Future<String?> uploadImage(File image) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    //final fileName = basename(image.path);
    final destination = 'profilePictures/$userId';
    logger.i("Upload img from path: $destination");
    final storageRef = FirebaseStorage.instance.ref();
    final ref = storageRef.child(destination);
    try {
      await ref.putFile(image);
      final downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      logger.e("Error al subir la imagen a Firebase Storage: $e");
      return null;
    }
  }
}
