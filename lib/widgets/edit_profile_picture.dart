import 'dart:io';

import 'package:equipo_estrella/commons/fonts.dart';
import 'package:equipo_estrella/widgets/buttons/short_button.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';

import '../commons/colors.dart';

class EditProfilePicture extends StatefulWidget {
  final bool hasProfilePic;

  const EditProfilePicture({
    Key? key,
    required this.hasProfilePic,
  }) : super(key: key);

  @override
  _EditProfilePictureState createState() => _EditProfilePictureState();
}

class _EditProfilePictureState extends State<EditProfilePicture> {
  var logger = Logger();
  File? _selectedImage;

  Future<void> _pickImage() async {
    // final imagePicker = ImagePicker();
    // final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    // logger.i(
    //     "the name of the file is ${pickedFile!.name} and the extension is ${pickedFile.mimeType}. additionally, the path is ${pickedFile.path}");

    // setState(() {
    //   if (pickedFile != null) {
    //     _selectedImage = File(pickedFile.path);
    //   }

    try {
      final imagePicker = ImagePicker();
      final pickedFile = await imagePicker.pickImage(
          source: ImageSource.gallery, maxWidth: 1500, maxHeight: 1500);
      logger.i(
          "the name of the file is ${pickedFile!.name} and the extension is ${pickedFile.mimeType}. additionally, the path is ${pickedFile.path}");
      if (pickedFile != null) return;

      final imageTemp = File(pickedFile.path);
      setState(() => _selectedImage = imageTemp);
    } catch (e) {
      logger.e("Error al seleccionar la imagen: $e");
    }
    //   setState(() {
    //     if (pickedFile != null) {
    //       _selectedImage = File(pickedFile.path);
    //     }
    //   });
    // } catch (e) {
    //   logger.e("Error al seleccionar la imagen: $e");
    // }

    // });

    // Subir la imagen a Firebase Storage
    await _uploadImageToFirebase();
  }

  Future<void> _uploadImageToFirebase() async {
    if (_selectedImage == null) {
      return;
    }

    final fileName = basename(_selectedImage!.path);
    final destination = 'files/$fileName';
    logger.i("Upload img from path: ${destination}");
    try {
      final ref = FirebaseStorage.instance.ref(destination).child('fileaneta/');
      await ref.putFile(_selectedImage!);
    } catch (e) {
      logger.e("Error al subir la imagen a Firebase Storage: $e");
    }

    // // Create a storage reference from our app
    // final storageRef = FirebaseStorage.instance.ref();
    // // Create a reference to "mountains.jpg"
    // final mountainsRef = storageRef.child("mountains.jpg");

    // try {
    //   await mountainsRef.putFile(_selectedImage!);
    // } on FirebaseException catch (e) {
    //   // ...
    // }

    // try {
    //   final userId = FirebaseAuth.instance.currentUser?.uid;
    //   if (userId != null) {
    //     final storageRef =
    //         FirebaseStorage.instance.ref().child('profile_pics/$userId.jpg');
    //     await storageRef.putFile(_image!);
    //   }
    // } catch (e) {
    //   print('Error al subir la imagen a Firebase Storage: $e');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      alignment: Alignment.center,
      // padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 1000,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: ManosColors.secondary25,
            ),
            child: !widget.hasProfilePic
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Foto de perfil",
                        style: ManosFonts.sub1(),
                      ),
                      ShortButton(onPressedMethod: () => {}, text: "Subir foto")
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Foto de perfil",
                                style: ManosFonts.sub1(),
                              )),
                          const SizedBox(height: 8),
                          ShortButton(
                              onPressedMethod: _pickImage, text: "Cambiar foto")
                        ],
                      ),
                      ClipOval(
                        child: Image.asset(
                          "assets/profile_pic.jpg",
                          width: 84,
                          height: 84,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
