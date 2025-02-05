import '../../../auth/data/lists/status_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';

class StoryWidget extends StatefulWidget {
  final String text, imageUrl;
  const StoryWidget({super.key, this.text = " ", required this.imageUrl});

  @override
  State<StoryWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  final controller = StoryController();
  int index = 0;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoryView(
        controller: controller,
        onStoryShow: (_, i) {
          IconButton(icon: const Icon(Icons.backspace_outlined), onPressed: () => Get.back());
        },
        onComplete: () {
          if (index < listStatus.length - 1) {
            controller.next();
          }
          Get.back();
        },
        progressPosition: ProgressPosition.top,
        repeat: true,
        inline: false,

        storyItems: [
          StoryItem.text(
              title: widget.text,
              backgroundColor: Colors.brown,
              roundedTop: true,
              shown: true,

              textStyle: const TextStyle(decoration: TextDecoration.none, fontSize: 20, color: Colors.white)),
          StoryItem.pageImage(
              url: widget.imageUrl,
              caption: Text(widget.text,
                  style: const TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.none), textAlign: TextAlign.center),
              controller: controller),
        ]);
  }
}
