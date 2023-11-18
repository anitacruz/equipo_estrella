import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/controllers/user_controller.dart';
import 'package:equipo_estrella/models/user_model.dart';
import 'package:equipo_estrella/widgets/cards/edit_information_card.dart';
import 'package:equipo_estrella/widgets/custom_form_field.dart';
import 'package:equipo_estrella/widgets/edit_profile_picture.dart';
import 'package:equipo_estrella/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../commons/fonts.dart';

class EditProfile extends ConsumerStatefulWidget {
  const EditProfile({Key? key, required this.userModel}) : super(key: key);

  final UserModel userModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => EditProfileState();
}

class EditProfileState extends ConsumerState<EditProfile> {
  UserModel? currUser;

  bool isValid = false;
  DateTime? selectedDate;
  String genderOption = '';
  TextEditingController birthDateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController altEmailController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set initial values in controllers
    genderOption = widget.userModel.gender;
    selectedDate = DateFormat("dd/MM/yyyy").parse(widget.userModel.birthDate);
    birthDateController.text = widget.userModel.birthDate;
    phoneController.text = widget.userModel.phone;
    altEmailController.text = widget.userModel.altEmail;
    imageUrlController.text = widget.userModel.imageUrl;
  }

  Future<void> _updateUser(BuildContext contex, ref, UserModel newModel) async {
    var userController = ref.watch(userControllerProvider.notifier);
    await userController.updateUser(newModel);
  }

  void validFields(UserModel currModel) {
    setState(() {
      isValid = currModel.phone != '' &&
          currModel.altEmail != '' &&
          currModel.birthDate != '' &&
          currModel.gender != '';
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void selectOption(String option) {
    setState(() {
      genderOption = option;
    });
  }

  Widget buildOption(String optionText) {
    logger.w(" $optionText, $genderOption");
    final String imagePath = genderOption == optionText
        ? 'assets/radio_button_checked.png'
        : 'assets/radio_button_unchecked.png';

    return Row(children: [
      Image.asset(
        imagePath,
        width: 24,
        height: 24,
        color: genderOption == optionText
            ? ManosColors.primary100
            : Colors.transparent,
      ),
      const SizedBox(width: 8),
      Text(
        optionText,
        style: ManosFonts.b1(),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final map = widget.userModel.toJson();
    currUser = UserModel.fromMap(map, widget.userModel.id);

    logger.e("CURR USER: ${currUser?.toJson()}");

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: ManosColors.neutral75,
          ),
          color: ManosColors.neutral100,
          onPressed: () => Navigator.pop(context),
        )),
        body: SingleChildScrollView(
            child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Datos del perfil",
                  style: ManosFonts.h1(),
                ),
              ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Fecha de nacimiento: ${selectedDate != null ? DateFormat("dd/MM/yyyy").format(selectedDate!) : 'Seleccione la fecha'}",
                    style: ManosFonts.b1(),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 1000,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(4)),
                      color: ManosColors.secondary25,
                    ),
                    child: Text(
                      "Información personal",
                      style: ManosFonts.sub1(),
                    ),
                  ),
                  Container(
                    width: 1000,
                    padding: const EdgeInsets.only(
                        left: 16, top: 8, bottom: 8, right: 16),
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(4)),
                      color: ManosColors.neutral10,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => selectOption("Hombre"),
                          child: buildOption("Hombre"),
                        ),
                        const SizedBox(height: 8),
                        InkWell(
                          onTap: () => selectOption("Mujer"),
                          child: buildOption("Mujer"),
                        ),
                        const SizedBox(height: 8),
                        InkWell(
                            onTap: () => selectOption("No binario"),
                            child: buildOption("No binario")),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              EditProfilePicture(
                hasProfilePic: imageUrlController.text.isNotEmpty,
                imageController: imageUrlController,
              ),
              const SizedBox(height: 32),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Datos de contacto",
                  style: ManosFonts.h1(),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Estos datos serán compartidos con la organización para ponerse en contacto contigo",
                  style: ManosFonts.sub1(),
                ),
              ),
              const SizedBox(height: 24),
              CustomFormField(
                fieldName: "Teléfono",
                hintText: "Ej: +541178445459",
                alwaysFloatingLabel: true,
                controller: phoneController,
              ),
              const SizedBox(height: 24),
              CustomFormField(
                fieldName: "Mail",
                hintText: "Ej: name@mail.com",
                alwaysFloatingLabel: true,
                controller: altEmailController,
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                text: "Guardar datos",
                // disabled: !isValid,
                onPressedMethod: () {
                  // Get values from controllers
                  // String birthDate = selectedDate in format dd/mm/yyyy
                  if (selectedDate == null) {
                    logger.e("SELECTED DATE IS NULL");
                    return;
                  }

                  // Check if fields are not empty
                  if (birthDateController.text.isEmpty ||
                      phoneController.text.isEmpty ||
                      altEmailController.text.isEmpty) {
                    logger.e("FIELDS ARE EMPTY");
                  }
                  if (currUser == null) {
                    return;
                  }

                  logger.w(DateFormat("dd/MM/yyyy").format(selectedDate!));
                  String birthDate =
                      DateFormat("dd/MM/yyyy").format(selectedDate!);
                  String phone = phoneController.text;
                  String altEmail = altEmailController.text;
                  String imageUrl = imageUrlController.text;
                  String gender = genderOption;

                  // Create a new UserModel with updated values
                  UserModel updatedUser = currUser!.copyWith(
                      newBirthDate: birthDate,
                      newPhone: phone,
                      newAltEmail: altEmail,
                      newImageUrl: imageUrl,
                      newGender: gender);

                  // Call _updateUser with the updated UserModel
                  _updateUser(context, ref, updatedUser).whenComplete(() {
                    Navigator.pop(context);
                  });
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        )));
  }
}
