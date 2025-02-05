import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../auth/data/lists/status_list.dart';
import '../../resources/constants.dart';
import 'widgets/shareable_widget_call_status.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8fbf2),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStatusListTile(),
              const CustomText(title: "Recent updates"),
              SizedBox(width: double.maxFinite, height: MediaQuery.sizeOf(context).height / 2.h, child: const CustomStatusTiles(isExist: false)),
              const CustomText(title: "Viewed updates"),
              SizedBox(height: MediaQuery.sizeOf(context).height / 3.h, child: const CustomStatusTiles(isExist: false))
            ],
          ),
        ),
      ),
    );
  }

  ListTile _buildStatusListTile() {
    return ListTile(
      minVerticalPadding: 0,
      contentPadding: const EdgeInsets.all(0),
      leading: AdvancedAvatar(
        size: 55,
        image: NetworkImage(listStatus[1].image),
        foregroundDecoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.green, width: 3)),
      ),
      title: Text("My Status", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600)),
      subtitle: Text("tap to add status update", style: TextStyle(fontSize: 15.sp, color: ConstantColor.textColor, fontWeight: FontWeight.w700)),
    );
  }
}
