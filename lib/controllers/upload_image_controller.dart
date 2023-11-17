import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'upload_image_controller.g.dart';

var logger = Logger();

@riverpod
class UploadImageController extends _$UploadImageController {
  @override
  Future<void> build() async {}

  Future<void> uploadImage(File image) async {
    final fileName = basename(image.path);
    final destination = 'images/$fileName';
    logger.i("Upload img from path: $destination");
    final storageRef = FirebaseStorage.instance.ref();
    final ref = storageRef.child(destination);
    try {
      await ref.putFile(image);
    } catch (e) {
      logger.e("Error al subir la imagen a Firebase Storage: $e");
    }
  }
}
