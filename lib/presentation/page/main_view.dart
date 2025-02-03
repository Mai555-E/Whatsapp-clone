import 'package:flutter/material.dart';

import '../resources/constants.dart';
import '../status/calls_screen.dart';
import '../status/status_screen.dart';
import 'chats_screen.dart';
import 'custom_popup_menu_button.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late int currentIndex = 0;
  final pages = [const ChatsScreen(), const StatusScreen(), const CallsScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("WhatsApp", style: TextStyle(fontWeight: FontWeight.w500)),
          elevation: 2,
          shadowColor: Colors.black,
          backgroundColor: ConstantColor.secondBackground,
          actions: const [
            Icon(Icons.search),
            CustomPopupMenuButton(text1: "Setting", text2: "Started", text3: "New Group", text4: "WhatsApp Web")
          ]),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        backgroundColor: ConstantColor.secondBackground,
        selectedLabelStyle: const TextStyle(color: ConstantColor.secondaryColor, fontWeight: FontWeight.w600),
        selectedItemColor: ConstantColor.secondaryColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.chat, color: ConstantColor.secondaryColor), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.update_sharp, color: ConstantColor.secondaryColor), label: "Status"),
          BottomNavigationBarItem(icon: Icon(Icons.call, color: ConstantColor.secondaryColor), label: "Calls")
        ],
      ),
    );
  }
}
