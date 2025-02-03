import 'package:whatsapp_clone_app/presentation/page/chats_screen.dart';

import '../auth/otp_screen.dart';

import '../page/main_view.dart';
import '../chat/chat_screen.dart';
import '../chat/chat_screen_receiver.dart';

import '../status/calls_screen.dart';
import '../status/status_screen.dart';

import '../auth/profile_screen.dart';
import '../auth/register_screen.dart';

import '../auth/login_screen.dart';
import '../splash_screen/splash_screen.dart';
import 'package:get/get.dart';

import '../chat/new_chat_selection.dart';

class NamedRoutes {
  NamedRoutes._();

  static const String splashScreen = "/splashScreen";
  static const String loginScreen = "/loginScreen";
  static const String registerScreen = "/registerScreen";
  static const String profileScreen = "/profileScreen";
  static const String otpScreen = "/otpScreen";

  //
  static const String ChatsScreen = "/ChatsScreen";
  static const String statusScreen = "/statusScreen";
  static const String callScreen = "/callScreen";
  static const String mainView = "/mainView";
  static const String NewChatSelection = "/NewChatSelection";
  static const String chatScreen = "/chatScreen";
  static const String chatScreenReceiver = "/chatScreenReceiver";
}

class RouteGenerator {
  static List<GetPage> getRoute() {
    return [
      GetPage(name: NamedRoutes.splashScreen, page: () => const SplashScreen()),
      GetPage(name: NamedRoutes.loginScreen, page: () => const LoginScreen()),
      GetPage(name: NamedRoutes.registerScreen, page: () => const RegisterScreen()),
      GetPage(name: NamedRoutes.profileScreen, page: () => const ProfileScreen()),
      GetPage(name: NamedRoutes.otpScreen, page: () => const OtpScreen(phone: '')),

      //
      GetPage(name: NamedRoutes.NewChatSelection, page: () =>  NewChatSelection(isGroup: Get.arguments)),
      GetPage(name: NamedRoutes.ChatsScreen, page: () => const ChatsScreen()),
      GetPage(name: NamedRoutes.callScreen, page: () => const CallsScreen()),
      GetPage(name: NamedRoutes.statusScreen, page: () => const StatusScreen()),
      GetPage(name: NamedRoutes.mainView, page: () => const MainView()),
      GetPage(name: NamedRoutes.chatScreen, page: () =>  ChatScreen(imageUrl: Get.arguments, name: Get.arguments)),
      GetPage(name: NamedRoutes.chatScreenReceiver, page: () => ChatScreenReceiver(imageUrl:Get.arguments, isName: Get.arguments)),
    ];
  }
}
