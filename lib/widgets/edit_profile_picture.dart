import 'dart:io';

import 'package:equipo_estrella/commons/fonts.dart';
import 'package:equipo_estrella/controllers/upload_image_controller.dart';
import 'package:equipo_estrella/widgets/buttons/short_button.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';

import '../commons/colors.dart';

class EditProfilePicture extends ConsumerStatefulWidget {
  final bool hasProfilePic;
  final TextEditingController imageController;

  const EditProfilePicture(
      {Key? key, required this.hasProfilePic, required this.imageController})
      : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      EditProfilePictureState();
}

class EditProfilePictureState extends ConsumerState<EditProfilePicture> {
  var logger = Logger();
  File? _selectedImage;

  Future<void> _pickImage() async {
    var uploadImageController =
        ref.watch(uploadImageControllerProvider.notifier);

    try {
      final imagePicker = ImagePicker();
      final pickedFile = await imagePicker.pickImage(
          source: ImageSource.gallery, maxWidth: 1500, maxHeight: 1500);
      logger.i(
          "the name of the file is ${pickedFile!.name} and the extension is ${pickedFile.mimeType}. additionally, the path is ${pickedFile.path}");

      final imageTemp = File(pickedFile.path);
      logger.i("ya tengo el image temp!");
      setState(() => _selectedImage = imageTemp);
      logger.i("despues de setear el estado");
    } catch (e) {
      logger.e("Error al seleccionar la imagen: $e");
    }
    // Subir la imagen a Firebase Storage
    widget.imageController.text =
        (await uploadImageController.uploadImage(_selectedImage!))!;
  }

  Future<void> _uploadImageToFirebase() async {
    if (_selectedImage == null) {
      return;
    }

    final fileName = basename(_selectedImage!.path);
    final destination = 'files/$fileName';
    logger.i("Upload img from path: $destination");
    try {
      final ref = FirebaseStorage.instance.ref().child(destination);
      await ref.putFile(_selectedImage!);
    } catch (e) {
      logger.e("Error al subir la imagen a Firebase Storage: $e");
    }
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
                      ShortButton(
                          onPressedMethod: () => {_pickImage()},
                          text: "Subir foto")
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
