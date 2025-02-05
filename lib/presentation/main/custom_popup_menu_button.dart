import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/constants.dart';
import '../resources/routes.dart';

class CustomPopupMenuButton extends StatelessWidget {
  final String text1, text2, text3, text4;
  const CustomPopupMenuButton({super.key, required this.text1, required this.text2, required this.text3, required this.text4});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: ConstantColor.backgroundColor,
      itemBuilder: (_) => [
        PopupMenuItem(value: text1, child: Text(text1)),
        PopupMenuItem(value: text2, child: Text(text2)),
        PopupMenuItem(
          value: text3,
          child: Text(text3),
          onTap: () => Get.toNamed(NamedRoutes.newChatSelection, arguments: true),
        ),
        PopupMenuItem(value: text4, child: Text(text4))
      ],
    );
  }
}
