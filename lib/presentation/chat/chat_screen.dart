import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_app/presentation/chat/chat_details.dart';
import 'package:whatsapp_clone_app/presentation/resources/images.dart';

import '../main/custom_popup_menu_button.dart';
import '../resources/constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String name = "Mai";
  static final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColor.chatBackground,
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                reverse: true,
                itemCount: [].length,
                padding: const EdgeInsets.only(bottom: 15),
                separatorBuilder: (_, __) => const SizedBox(height: 2),
                itemBuilder: (_, index) => BubbleSpecialThree(
                  tail: true,
                  text: textController.text, // chatList[index].message.toString(),
                  textStyle: const TextStyle(color: Colors.black87, fontSize: 16),
                  isSender: false, // chatList[index].senderName == widget.name ? true : false
                  color: Colors.white, // chatList[index].senderName == widget.name ? ConstantColor.chatBubble : ConstantColor.chatMessage
                ),
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 50,
              color: Colors.white,
              child: Row(
                spacing: 0,
                children: [
                  _buildMessageSender(),
                  _buildMessageType(context),
                  IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt, color: ConstantColor.buttonsColor)),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.voice_chat, color: ConstantColor.buttonsColor),
                    style: ButtonStyle(minimumSize: WidgetStatePropertyAll(Size(30, 30))),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox _buildMessageType(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 1.7,
      height: 40,
      child: TextField(
        controller: textController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          enabled: true,
          hintMaxLines: 2,
          hintText: "Message",
          contentPadding: EdgeInsets.all(8),
          fillColor: Colors.white70,
          suffixIcon: Icon(Icons.chat, color: ConstantColor.buttonsColor),
          border: InputBorder.none,
          focusedErrorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Color(0xffE5E4E2)), borderRadius: BorderRadius.all(Radius.circular(30))),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Color(0xffE5E4E2)), borderRadius: BorderRadius.all(Radius.circular(30))),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Color(0xffE5E4E2)), borderRadius: BorderRadius.all(Radius.circular(30))),
          hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildMessageSender() {
    return IconButton(
      onPressed: () => setState(
        () {
          if (textController.text.isNotEmpty) {
            //chatList.add(ChatModel(senderName: "Mai", message: textController.text));
          }
          textController.clear();
        },
      ),
      icon: Icon(Icons.send, color: ConstantColor.chatSender, size: 25),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_ios)),
      title: GestureDetector(
        onTap: ()=> Get.to(ChatDetails()),
        child: Row(
          spacing: 8,
          children: [
            CircleAvatar(backgroundImage: AssetImage(NamedImages.profileSoloLeveling), radius: 20),
            Text(name, style: const TextStyle(fontSize: 28)),
          ],
        ),
      ),
      leadingWidth: 20,
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
    );
  }
}





/*

Container(
                  width: 70,
                  height: 60,
                  margin: const EdgeInsets.only(left: 10, right: 5),
                  padding: const EdgeInsets.only(left: 12, right: 10, top: 7),
                  decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: TextField(
                    controller: textController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: "Message",
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ),
                ),



*/

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