import 'package:flutter/material.dart';

import '../../resources/constants.dart';
import 'widgets/shareable_widget_call_status.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ConstantColor.secondBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(title: "Recent"),
              Expanded(child: CustomStatusTiles(isExist: true)),
            ],
          ),
        ),
      ),
    );
  }
}
