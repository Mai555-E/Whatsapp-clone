import '../../resources/constants.dart';
import 'otp_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class OtpBody extends StatefulWidget {
  final String phone;
  const OtpBody({super.key, required this.phone});

  @override
  State<OtpBody> createState() => _OtpBodyState();
}

class _OtpBodyState extends State<OtpBody> {
  static GlobalKey formKey = GlobalKey<FormState>();
  //static FirebaseAuth auth = FirebaseAuth.instance;
  static String? verifyId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Enter OTP Code", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          leading: IconButton(onPressed: () => Get.back, icon: const Icon(Icons.arrow_back, color: ConstantColor.secondaryColor))),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(alignment: Alignment.center, child: Text("Code has been sent to +${widget.phone}", textAlign: TextAlign.center)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                width: double.maxFinite,
                height: MediaQuery.sizeOf(context).height / 7,
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
              ElevatedButton(
                  onPressed: () async {
                    // await FirebaseAuth.instance
                    //     .verifyPhoneNumber(
                    //   phoneNumber: widget.phone,
                    //   verificationCompleted: (PhoneAuthCredential credential) {},
                    //   verificationFailed: (FirebaseAuthException e) {},
                    //   codeSent: (String verificationId, int? resendToken) async {
                    //     verifyId = verificationId;
                    //     sentCode();
                    //   },
                    //   codeAutoRetrievalTimeout: (String verificationId) {},
                    // )
                    //     .then((val) {
                    //   Get.toNamed(NamedRoutes.ChatsPage);

                    //   print(widget.phone);
                    // });
                  },
                  child: const Text("verify"))
            ],
          ),
        ),
      ),
    );
  }

  // sentCode() async {
  //   try {
  //     String smsCode = c1.text + c2.text + c3.text + c4.text + c5.text + c6.text;

  //     PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verifyId!, smsCode: smsCode);

  //     await auth.signInWithCredential(credential).then((val) {
  //       Get.toNamed(NamedRoutes.mainView);
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}
