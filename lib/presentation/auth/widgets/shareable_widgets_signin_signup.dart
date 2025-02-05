import 'package:flutter/material.dart';

import '../../resources/images.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.width, required this.height});
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(NamedImages.logo, width: width, height: height);
  }
}

class CustomTextAuth extends StatelessWidget {
  const CustomTextAuth({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500), textAlign: TextAlign.center);
  }
}
