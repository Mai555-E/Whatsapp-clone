import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../resources/constants.dart';
import '../../resources/routes.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/shareable_widgets_signin_signup.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      backgroundColor: const Color(0xffECE5DD),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 15.h),
      child: SingleChildScrollView(
        child: Form(
          key: LoginController.formKey,
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImage(width: 230.w, height: 230.h),
              const CustomTextAuth(title: "Login to your account"),
              CustomTextFormField(label: 'Email', icon: Icons.email),
              CustomTextFormField(label: 'Password', icon: Icons.lock),
              ElevatedButton(
                onPressed: () async {
                  if (LoginController.formKey.currentState!.validate()) {
                    final loggedIn = await LoginController.login();

                    if (loggedIn) {
                      Get.offNamed(NamedRoutes.mainView);
                    } else {
                      print("Failed");
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  maximumSize: Size.fromHeight(150),
                  backgroundColor: ConstantColor.buttonsColor,
                ),
                child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 25.h)),
              ),
              _buildLoginBodyRow()
            ],
          ),
        ),
      ),
    );
  }

  Row _buildLoginBodyRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?", style: TextStyle(fontSize: 15.sp)),
        TextButton(
          onPressed: () => Get.offNamed(NamedRoutes.registerScreen),
          child: Text("Register", style: TextStyle(fontSize: 16.sp, color: ConstantColor.buttonsColor)),
        )
      ],
    );
  }
}
