import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_app/presentation/chat/new_chat_selection.dart';
import 'package:whatsapp_clone_app/presentation/resources/routes.dart';

import '../auth/data/lists/status_list.dart';
import '../chat/chat_screen.dart';
import '../chat/chat_screen_receiver.dart';
import '../resources/constants.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  static DateTime hours = DateTime.now();
  static List<Contact> contacts = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ConstantColor.secondBackground,
        body: Column(
          children: [
            SizedBox(
                width: double.maxFinite,
                height: MediaQuery.sizeOf(context).height / (1.3).h,
                child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                    itemCount: 2,
                    itemBuilder: (context, index) => _buildListTileHomeBody(index, context)))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => NewChatSelection(isGroup: false));
            // Navigator.pushNamed(context, NewChatSelection(isExcit: ""));
          },
          backgroundColor: ConstantColor.secondaryColor,
          child: const Icon(Icons.chat, color: Colors.white),
        ));
  }

  InkWell _buildListTileHomeBody(int index, BuildContext context) {
    return InkWell(
        onTap: () {
          if (listStatus[index].name == "Mai") {
            Get.toNamed(NamedRoutes.ChatsScreen,arguments: contacts[index].displayName, );
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChatScreenReceiver(imageUrl: listStatus[index].image, isName: listStatus[index].name)));
          }
        },
        child: ListTile(
          contentPadding: EdgeInsets.only(top: 10.h, right: 5.h),
          leading: CircleAvatar(radius: 30.h, backgroundImage: NetworkImage(listStatus[index].image)),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(listStatus[index].time, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
              CircleAvatar(
                  radius: 12.h,
                  backgroundColor: ConstantColor.secondaryColor,
                  child: const Text("2", style: TextStyle(color: Colors.white)))
            ],
          ),
          title: Text(listStatus[index].name, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600)),
        ));
  }
}

//ChatScreen(imageUrl: listStatus[index].image, name: listStatus[index].name)