import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:get/get.dart';

import '../../../auth/data/lists/status_list.dart';
import '../../../resources/constants.dart';
import 'story_widget.dart';

class CustomStatusTiles extends StatelessWidget {
  final bool isExist;
  const CustomStatusTiles({super.key, required this.isExist});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listStatus.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          if (isExist == false) {
            Get.to(StoryWidget(imageUrl: listStatus[index].image, text: listStatus[index].name));
          }
        },
        minVerticalPadding: 0,
        contentPadding: const EdgeInsets.all(0),
        leading: (isExist == false)
            ? AdvancedAvatar(
                size: 55,
                image: NetworkImage(listStatus[index].image),
                foregroundDecoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.green, width: 3)),
              )
            : AdvancedAvatar(foregroundDecoration: BoxDecoration(shape: BoxShape.circle), size: 55, image: NetworkImage(listStatus[index].image)),
        trailing: Visibility(visible: isExist, child: const Icon(Icons.phone, size: 30)),
        title: Text(listStatus[index].name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        subtitle: Text("Today :${listStatus[index].time}", style: const TextStyle(fontSize: 15)),
      ),
    );
  }
}

/// *******************************************************************
// custom text

class CustomText extends StatelessWidget {
  final String title;
  const CustomText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: const TextStyle(color: ConstantColor.textColor, fontWeight: FontWeight.w700));
  }
}
