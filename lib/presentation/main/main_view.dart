import 'package:flutter/material.dart';

import '../resources/constants.dart';
import 'custom_popup_menu_button.dart';
import 'pages/calls_page.dart';
import 'pages/chats_page.dart';
import 'pages/status_page.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  static int currentIndex = 0;
  static const pages = [ChatsPage(), StatusScreen(), CallsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: pages[currentIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 2,
      shadowColor: Colors.black,
      backgroundColor: ConstantColor.secondBackground,
      title: const Text("WhatsApp", style: TextStyle(fontWeight: FontWeight.w500)),
      actions: const [Icon(Icons.search), CustomPopupMenuButton(text1: "Setting", text2: "Started", text3: "New Group", text4: "WhatsApp Web")],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: currentIndex,
      backgroundColor: ConstantColor.secondBackground,
      selectedItemColor: ConstantColor.secondaryColor,
      onTap: (index) => setState(() => currentIndex = index),
      selectedLabelStyle: const TextStyle(color: ConstantColor.secondaryColor, fontWeight: FontWeight.w600),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.chat, color: ConstantColor.secondaryColor), label: 'Chats'),
        BottomNavigationBarItem(icon: Icon(Icons.update_sharp, color: ConstantColor.secondaryColor), label: "Status"),
        BottomNavigationBarItem(icon: Icon(Icons.call, color: ConstantColor.secondaryColor), label: "Calls")
      ],
    );
  }
}
