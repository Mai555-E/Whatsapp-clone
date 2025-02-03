import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: Get.back,
      child: Container(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          width: 40,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: const Icon(Icons.arrow_back_sharp, size: 30)),
    );
  }
}