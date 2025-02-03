import '../resources/constants.dart';
import '../../domain/models/chat_list.dart';
import '../../domain/models/chat_model.dart';
import 'shareable_widget/shareable_widgets.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';

import '../page/custom_popup_menu_button.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.imageUrl, required this.name});
  final String imageUrl, name;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  static final textController = TextEditingController();

  String name = "Mai";

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ConstantColor.chatBackground,
        appBar: AppBar(
          title: Row(
            spacing: 10,
            children: [
              CircleAvatar(backgroundImage: NetworkImage(widget.imageUrl), radius: 20),
              Text(widget.name, style: const TextStyle(fontSize: 28)),
            ],
          ),
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
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Expanded(
                  child: ListView.separated(
                      separatorBuilder: (_, __) => const SizedBox(height: 2),
                      padding: const EdgeInsets.only(bottom: 15),
                      reverse: true,
                      itemBuilder: (_, index) => BubbleSpecialThree(
                          isSender: chatList[index].senderName == widget.name ? true : false,
                          text: chatList[index].message.toString(),
                          color: chatList[index].senderName == widget.name ? ConstantColor.chatBubble : ConstantColor.chatMessage,
                          tail: true,
                          textStyle: const TextStyle(color: Colors.black87, fontSize: 16)),
                      itemCount: chatList.length)),
              Row(
                children: [
                  Expanded(
                      child: Container(
                          height: 60,
                          width: 70,
                          margin: const EdgeInsets.only(left: 10, right: 5),
                          padding: const EdgeInsets.only(left: 12, right: 10, top: 7),
                          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(30))),
                          child: TextField(
                              controller: textController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                  hintText: "Message", hintStyle: TextStyle(color: Colors.grey, fontSize: 18), border: InputBorder.none)))),
                  Container(
                      width: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: IconButton.filled(
                          onPressed: () => setState(() {
                                if (textController.text.isNotEmpty) {
                                  chatList.add(ChatModel(senderName: "Mai", message: textController.text));
                                }
                                textController.clear();
                              }),
                          style: IconButton.styleFrom(backgroundColor: ConstantColor.chatSender),
                          icon: const Icon(Icons.send, color: Colors.white, size: 25)))
                ],
              )
            ],
          ),
        ));
  }
}




// to display image
//listStatus.firstWhere((e) => e.name == "Mai").image

/**
 * final supabase = Supabase.instance.client;
  //final userId = Supabase.instance.client.auth.currentUser!.id;

  late final Stream<List<Message>> _messagesStream;
  final Map<String, ProfileModel> _profileCache = {};

  @override
  void initState() {
    final myUserId = supabase.auth.currentUser!.id;
    _messagesStream = supabase
        .from('messages')
        .stream(primaryKey: ['id'])
        .order('created_at')
        .map((maps) => maps.map((map) => Message.fromMap(map: map, myUserId: myUserId)).toList());
    super.initState();
  }
//********************************************************************* */

  Future<void> _loadProfileCache(String profileId) async {
    if (_profileCache[profileId] != null) {
      return;
    }
    final data = await supabase.from('profiles').select().eq('id', profileId).single();
    final profile = ProfileModel.fromMap(data);
    setState(() {
      _profileCache[profileId] = profile;
    });
  }

  //******************************************** */

  void _submitMessage() async {
    final text = textController.text;
    final myUserId = supabase.auth.currentUser!.id;
    if (text.isEmpty) {
      return;
    }
    textController.clear();
    try {
      await supabase.from('messages').insert({
        'profile_id': myUserId,
        'content': text,
      });
    } on PostgrestException catch (e) {
      print(e);
      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      // context.showErrorSnackBar( message: error.message);
    } catch (_) {
      print("unexpectedErrorMessage");
      //context.showErrorSnackBar(message: unexpectedErrorMessage);
    }
  }

 */