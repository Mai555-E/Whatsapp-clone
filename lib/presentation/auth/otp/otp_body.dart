import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/constants.dart';
import 'controller.dart';
import 'otp_custom.dart';

class OtpBody extends StatefulWidget {
  final String phone;
  const OtpBody({super.key, required this.phone});

  @override
  State<OtpBody> createState() => _OtpBodyState();
}

class _OtpBodyState extends State<OtpBody> {
  static String? verifyId;
  static GlobalKey formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
      backgroundColor: Colors.white,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text("Enter OTP Code", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
      leading: IconButton(onPressed: () => Get.back, icon: const Icon(Icons.arrow_back, color: ConstantColor.secondaryColor)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(alignment: Alignment.center, child: Text("Code has been sent to +${widget.phone}", textAlign: TextAlign.center)),
            Container(
              width: double.maxFinite,
              height: MediaQuery.sizeOf(context).height / 7,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OTP(last: false, first: true, phoneController: c1),
                  OTP(last: false, first: false, phoneController: c2),
                  OTP(last: false, first: false, phoneController: c3),
                  OTP(last: false, first: false, phoneController: c4),
                  OTP(last: false, first: false, phoneController: c5),
                  OTP(last: true, first: false, phoneController: c6)
                ],
              ),
            ),
            ElevatedButton(onPressed: () {}, child: const Text("verify"))
          ],
        ),
      ),
    );
  }
}
