import 'dart:io';
import 'package:expense_manager/app_page_injectable.dart';
import 'package:expense_manager/login/login_page.dart';
import 'package:expense_manager/settings/constants.dart';
import 'package:expense_manager/settings/select_photo_options_screen.dart';
import 'package:expense_manager/settings/settings_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  File? _image;

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
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
                            color: Colors.yellow,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Text("youssef",
                    style: Theme.of(context).textTheme.headlineMedium),
                Text("youssef.benhissi@esprit.tn",
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      context.gNavigationService.openAccountProfile(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        side: BorderSide.none,
                        shape: const StadiumBorder()),
                    child: const Text(
                      "Edit",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 20),
                Column(children: [
                  CustomListTile(
                    title: "Personal Data",
                    onTap: () {
                      context.gNavigationService.openAccountProfile(context);
                    },
                    leadingIcon: CupertinoIcons.person_fill,
                    trailingIcon: CupertinoIcons.chevron_forward,
                  ),
                  CustomListTile(
                    title: "Settings",
                    onTap: () {
                      context.gNavigationService
                          .openApplicationSettings(context);
                    },
                    leadingIcon: CupertinoIcons.settings,
                    trailingIcon: CupertinoIcons.chevron_forward,
                  ),
                ]),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                Column(
                  children: [
                    CustomListTile(
                      title: "FAQ",
                      onTap: () {
                        context.gNavigationService.openFaq(context);
                      },
                      leadingIcon: CupertinoIcons.ellipsis_vertical_circle_fill,
                      trailingIcon: CupertinoIcons.chevron_forward,
                    ),
                    CustomListTile(
                      title: "Support",
                      onTap: () {
                        context.gNavigationService.openChatScreen(context);
                      },
                      leadingIcon: Icons.support_agent,
                      trailingIcon: CupertinoIcons.chevron_forward,
                    ),
                    CustomListTile(
                      title: "Contact Us",
                      onTap: () {
                        context.gNavigationService.openContactUsScreen(context);
                      },
                      leadingIcon: CupertinoIcons.person_3_fill,
                      trailingIcon: CupertinoIcons.chevron_forward,
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 10),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShowCaseWidget(
                              builder: Builder(
                                  builder: (context) => const LoginPage()),
                            ),
                          ),
                        );
                      },
                      leading: Container(
                        height: 50,
                        width: 50,
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: klightContentColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(Icons.logout, color: Colors.red),
                      ),
                      title: const Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: ksmallFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: const Icon(
                        CupertinoIcons.chevron_forward,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
