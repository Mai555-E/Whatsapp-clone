import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:whatsapp_clone_app/domain/models/chat.dart';
import 'package:whatsapp_clone_app/presentation/resources/routes.dart';

import '../auth/data/lists/status_list.dart';
import '../auth/data/model/status_model.dart';
import '../main/custom_popup_menu_button.dart';
import '../resources/constants.dart';
import 'chat_screen.dart';

class NewChatSelection extends StatelessWidget {
  final bool isGroup;
  const NewChatSelection({super.key, required this.isGroup});

  Future<List<Contact>> _getContacts() async {
    if (await Permission.contacts.request().isGranted) {
      return await FlutterContacts.getContacts(withProperties: true);
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      appBar: _buildAppBar(),
      backgroundColor: ConstantColor.secondBackground,
      floatingActionButton: isGroup ? _buildFloatingActionButton() : null,
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        // Get.off(() => ChatScreen(imageUrl: selectedImage!, name: selectedContact!));
        // ModelStatus(name: selectedContact!, image: selectedImage!, time: "");
      },
      backgroundColor: ConstantColor.secondaryColor,
      child: const Icon(Icons.arrow_forward, color: Colors.white),
    );
  }

  Widget _buildBody() {
    return FutureBuilder(
      future: _getContacts(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.data!.isEmpty) {
          return const Center(child: Text("No Contacts"));
        } else {
          return ListView.separated(
            itemCount: snapshot.data!.length,
            padding: const EdgeInsets.symmetric(vertical: 10),
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (_, index) => ListTile(
              leading: CircleAvatar(radius: 30, backgroundImage: NetworkImage(listStatus[index].image)),
              subtitle: Text(snapshot.data![index].phones.isNotEmpty ? snapshot.data![index].phones.first.number : "No Phones"),
              title:
                  Text(snapshot.data![index].displayName, style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 22)),
              onTap: () {
                if (isGroup) {
                  // Get.off(() => ChatScreen(imageUrl: selectedImage!, name: selectedContact!));
                  // ModelStatus(name: selectedContact!, image: selectedImage!, time: "");
                } else {
                  // Get.offNamed(NamedRoutes.chatScreen, arguments: Chat.newChat(isGroup, participantsId));
                }
              },
            ),
          );
        }
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
        elevation: 2,
        shadowColor: Colors.black,
        backgroundColor: ConstantColor.secondBackground,
        title: const Text("Select Contact", style: TextStyle(fontWeight: FontWeight.w500)),
        actions: const [Icon(Icons.search), CustomPopupMenuButton(text1: "Report", text2: "Block", text3: "Clear chat", text4: "Export chat")]);
  }
}

class StatusList {
  final String name;
  final String image;

  StatusList({required this.name, required this.image});
}
