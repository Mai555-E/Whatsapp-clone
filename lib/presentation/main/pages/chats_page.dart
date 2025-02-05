import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../auth/data/lists/status_list.dart';
import '../../chat/new_chat_selection.dart';
import '../../resources/constants.dart';
import '../../resources/routes.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  static List<Contact> contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      floatingActionButton: _buildFloatingButton(),
      backgroundColor: ConstantColor.secondBackground,
    );
  }

  Column _buildBody(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.maxFinite,
          height: MediaQuery.sizeOf(context).height / (1.3).h,
          child: ListView.separated(
            itemCount: 2,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) => _buildListTileHomeBody(index, context),
          ),
        ),
      ],
    );
  }

  InkWell _buildListTileHomeBody(int index, BuildContext context) {
    return InkWell(
      onTap: () {
        if (listStatus[index].name == "Mai") {
          Get.toNamed(NamedRoutes.chatScreen, arguments: contacts[index].displayName);
        } else {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (_) => ChatScreenReceiver(imageUrl: listStatus[index].image, isName: listStatus[index].name)));
        }
      },
      child: ListTile(
        contentPadding: EdgeInsets.only(top: 10.h, right: 5.h),
        leading: CircleAvatar(radius: 30.h, backgroundImage: NetworkImage(listStatus[index].image)),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(listStatus[index].time, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
            CircleAvatar(radius: 12.h, backgroundColor: ConstantColor.secondaryColor, child: const Text("2", style: TextStyle(color: Colors.white)))
          ],
        ),
        title: Text(listStatus[index].name, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600)),
      ),
    );
  }

  FloatingActionButton _buildFloatingButton() {
    return FloatingActionButton(
      backgroundColor: ConstantColor.secondaryColor,
      child: const Icon(Icons.chat, color: Colors.white),
      onPressed: () => Get.to(() => NewChatSelection(isGroup: false)),
    );
  }
}

//ChatScreen(imageUrl: listStatus[index].image, name: listStatus[index].name)
