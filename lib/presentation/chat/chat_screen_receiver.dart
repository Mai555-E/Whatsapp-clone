import '../resources/constants.dart';
import '../resources/routes.dart';
import '../../domain/models/chat_model.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';

import '../page/custom_popup_menu_button.dart';
import '../../domain/models/chat_list.dart';
import 'shareable_widget/shareable_widgets.dart';

class ChatScreenReceiver extends StatefulWidget {
  const ChatScreenReceiver({super.key, this.imageUrl = NamedRoutes.profileScreen, required this.isName});
  static final textController = TextEditingController();
  final String imageUrl, isName;
  @override
  State<ChatScreenReceiver> createState() => _ChatScreenReceiverState();
}

class _ChatScreenReceiverState extends State<ChatScreenReceiver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColor.chatBackground,
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [const CustomArrowBack(), CircleAvatar(backgroundImage: NetworkImage(widget.imageUrl), radius: 30)])),
        title: Padding(
            padding: const EdgeInsets.only(top: 10, right: 23),
            child: Text(widget.isName, style: const TextStyle(fontSize: 28), textAlign: TextAlign.left)),
        elevation: 0,
        leadingWidth: 100,
        actions: const [
          SizedBox(
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.videocam_outlined, size: 35),
                SizedBox(width: 10),
                Expanded(child: Icon(Icons.call_outlined, size: 25)),
                CustomPopupMenuButton(text1: "Report", text2: "Block", text3: "Clear chat", text4: "Export chat")
              ],
            ),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    reverse: true,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    itemBuilder: (_, index) => BubbleSpecialThree(
                        isSender: chatList[index].senderName == widget.isName ? true : false,
                        text: chatList[index].message.toString(),
                        color: chatList[index].senderName == widget.isName ? ConstantColor.chatBubble : ConstantColor.chatMessage,
                        tail: true,
                        textStyle: const TextStyle(color: Colors.black87, fontSize: 16)),
                    itemCount: chatList.length)),
            Row(
              children: [
                Expanded(
                    child: Container(
                        height: 60,
                        width: 70,
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        padding: const EdgeInsets.only(left: 12, right: 10, top: 7),
                        decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(30))),
                        child: TextField(
                            controller: ChatScreenReceiver.textController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                hintText: "Message", hintStyle: TextStyle(color: Colors.grey, fontSize: 18), border: InputBorder.none)))),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: 50,
                    child: IconButton.filled(
                        onPressed: () => setState(() {
                              if (ChatScreenReceiver.textController.text.isNotEmpty) {
                                chatList.add(ChatModel(senderName: "Sara", message: ChatScreenReceiver.textController.text));
                              }
                              ChatScreenReceiver.textController.clear();
                            }),
                        style: IconButton.styleFrom(backgroundColor: ConstantColor.chatSender),
                        icon: const Icon(Icons.send, color: Colors.white, size: 25)))
              ],
            )
          ],
        ),
      ),
    );
  }
}






// to display image
//listStatus.firstWhere((e) => e.name == "Mai").image