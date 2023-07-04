import 'dart:io';
import 'package:expense_manager/app_page_injectable.dart';
import 'package:expense_manager/common/app_bar.dart';
import 'package:expense_manager/common/text_field.dart';
import 'package:expense_manager/login/button.dart';
import 'package:expense_manager/settings/select_photo_options_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  File? _image;
  late TextEditingController fullNameEditingController;
  late TextEditingController emailEditingController;
  late TextEditingController phoneNumberEditingController;
  late TextEditingController passwordEditingController;
  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
        Navigator.of(context).pop();
      });
    } on PlatformException {
      Navigator.of(context).pop();
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsScreen(
                onTap: _pickImage,
              ),
            );
          }),
    );
  }

  @override
  void initState() {
    fullNameEditingController = TextEditingController();
    emailEditingController = TextEditingController();
    phoneNumberEditingController = TextEditingController();
    passwordEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    fullNameEditingController.dispose();
    emailEditingController.dispose();
    phoneNumberEditingController.dispose();
    passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: MyAppBar(
          onPressedFunction: () {
            context.gNavigationService.openSettings(context);
          },
          title: 'Edit Profile Page'),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Stack(
                children: [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: _image == null
                          ? Image.asset(
                              "assets/images/avatar.png",
                            )
                          : CircleAvatar(
                              backgroundImage: FileImage(_image!),
                              radius: 200.0,
                            ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        _showSelectPhotoOptions(context);
                      },
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.black,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                child: Column(
                  children: [
                    MyTextField(
                      prefixIcon: const Icon(Icons.person, color: Colors.grey),
                      controller: fullNameEditingController,
                      hintText: "Full Name",
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextField(
                      prefixIcon: const Icon(Icons.email, color: Colors.grey),
                      controller: emailEditingController,
                      hintText: "E-mail",
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextField(
                      prefixIcon: const Icon(Icons.phone, color: Colors.grey),
                      controller: phoneNumberEditingController,
                      hintText: "Phone no",
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextField(
                      prefixIcon:
                          const Icon(Icons.password, color: Colors.grey),
                      controller: passwordEditingController,
                      hintText: "Password",
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    MyButton(
                      title: "Edit Profile",
                      onTap: () {},
                      paddingValue: 15,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
