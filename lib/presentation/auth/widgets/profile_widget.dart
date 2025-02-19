import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/constants.dart';
import '../../resources/images.dart';

class CustomCircularAvatar extends StatelessWidget {
  final double imageHeigh, imageRadius, radius;
  final IconData icon;
  const CustomCircularAvatar({super.key, required this.imageHeigh, required this.imageRadius, required this.radius, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CircleAvatar(radius: imageRadius, backgroundColor: Colors.white, child: Image.asset(NamedImages.profileImage, height: imageHeigh)),
      Positioned(
          bottom: 0,
          right: 9.h,
          child:
              CircleAvatar(radius: radius, backgroundColor: ConstantColor.secondaryColor, child: Icon(icon, color: Colors.white, size: 15)))
    ]);
  }
}

class CustomProfileTextFormField extends StatelessWidget {
  final String label;

  const CustomProfileTextFormField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintMaxLines: 1, label: Text(label, style: TextStyle(fontWeight: FontWeight.w500)), hintText: "Enter your $label"),
    );
  }
}
