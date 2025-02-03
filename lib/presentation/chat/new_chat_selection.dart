import '../auth/data/model/status_model.dart';
import 'chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../resources/constants.dart';
import '../auth/data/lists/status_list.dart';
import '../page/custom_popup_menu_button.dart';

class NewChatSelection extends StatefulWidget {
  final bool isGroup;
  const NewChatSelection({super.key, required this.isGroup});

  @override
  State<NewChatSelection> createState() => _NewChatSelectionState();
}

class _NewChatSelectionState extends State<NewChatSelection> {
  static String? selectedContact;
  static String? selectedImage;
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();

    _getContacts();
  }

  Future<void> _getContacts() async {
    if (await Permission.contacts.request().isGranted) {
      final fetchedContacts = await FlutterContacts.getContacts(withProperties: true);

      setState(() => contacts = fetchedContacts);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: ConstantColor.secondBackground,
      body: _buildBody(),
      
      floatingActionButton:(widget.isGroup == "New Group")? _buildFloatingActionButton():null,
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {

        Get.off(()=> ChatScreen(imageUrl: selectedImage!, name: selectedContact!));
        ModelStatus(name: selectedContact!, image: selectedImage!, time: "");
      },
      backgroundColor: ConstantColor.secondaryColor,
      child: const Icon(Icons.arrow_forward, color: Colors.white),
    );
  }

  Widget _buildBody() {
    return contacts.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : ListView.separated(
            itemCount: contacts.length,
            padding: const EdgeInsets.symmetric(vertical: 10),
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (_, index) => ListTile(
              title: Text(contacts[index].displayName,
                  style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 22)),
              leading: CircleAvatar(radius: 30, backgroundImage: NetworkImage(listStatus[index].image)),
              subtitle: Text(contacts[index].phones.isNotEmpty ? contacts[index].phones.first.number : "No Phones"),
              onTap: () {
                selectedContact = contacts[index].displayName;
                selectedImage = listStatus[index].image;
                if (widget.isGroup != "New Group") {
                  Get.off(()=> ChatScreen(imageUrl: selectedImage!, name: selectedContact!));
                  ModelStatus(name: selectedContact!, image: selectedImage!, time: "");
                }
              },
            ),
          );
  }

  AppBar _buildAppBar() {
    return AppBar(
        title: const Text("Select Contact", style: TextStyle(fontWeight: FontWeight.w500)),
        elevation: 2,
        shadowColor: Colors.black,
        backgroundColor: ConstantColor.secondBackground,
        actions: const [
          Icon(Icons.search),
          CustomPopupMenuButton(text1: "Report", text2: "Block", text3: "Clear chat", text4: "Export chat")
        ]);
  }
}

class StatusList {
  final String name;
  final String image;

  StatusList({required this.name, required this.image});
}
