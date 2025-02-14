import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../presentation/chat/chat_details.dart';
import '../presentation/resources/routes.dart';
import '../presentation/resources/theme.dart';

class WhatsappClone extends StatelessWidget {
  const WhatsappClone({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, child) {
        return GetMaterialApp(
          theme: AppTheme.getTheme(),
          debugShowCheckedModeBanner: false,
          getPages: RouteGenerator.getRoute(),
         // initialRoute: NamedRoutes.chatDetails,
         home: ChatDetails(),
        );
      },
    );
  }
}
