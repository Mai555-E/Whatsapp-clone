import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../main/main_view.dart';
import '../resources/constants.dart';
import '../resources/images.dart';
import 'widgets/custom_text_form_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static XFile? imageFile;
  Future<void> getImage() async {
    final picker = ImagePicker();
    final XFile? pickerFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickerFile != null) {
      setState(() {
        imageFile = pickerFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ConstantColor.backgroundColor,
        appBar: AppBar(
            elevation: 2.h,
            shadowColor: const Color.fromARGB(115, 53, 38, 38),
            backgroundColor: ConstantColor.backgroundColor,
            leading: IconButton(onPressed: () => Get.off(const MainView()), icon: const Icon(Icons.arrow_back, color: ConstantColor.secondaryColor)),
            title: Text("Profile", style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w500))),
        body: _buildBodyProfile());
  }

  SingleChildScrollView _buildBodyProfile() {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        spacing: 20,
        children: [
          // circular avatar and image
          Stack(children: [
            CircleAvatar(
                radius: 65.w,
                backgroundColor: Colors.white,
                child: (imageFile != null) ? Image.file(File(imageFile!.path)) : Image.asset(NamedImages.profileImage, height: 100.h)),
            Positioned(
                bottom: 0,
                right: 9.h,
                child: GestureDetector(
                  onTap: () => getImage(),
                  child: CircleAvatar(
                      radius: 15.w,
                      backgroundColor: ConstantColor.secondaryColor,
                      child: const Icon(Icons.edit_rounded, color: Colors.white, size: 15)),
                ))
          ]),
          const Divider(),
          CustomTextFormField(icon: Icons.person, label: "Name"),
          CustomTextFormField(icon: Icons.phone_android_rounded, label: "Phone"),
          _buildElevatedButton()
        ],
      ),
    ));
  }

  ElevatedButton _buildElevatedButton() {
    return ElevatedButton.icon(
        onPressed: () async {},
        icon: const Icon(Icons.save, color: Colors.white),
        style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(55), backgroundColor: ConstantColor.buttonsColor),
        label: Text("Save Profile", style: TextStyle(color: Colors.white, fontSize: 20.sp)));
  }
}
