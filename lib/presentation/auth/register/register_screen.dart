import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../resources/constants.dart';
import '../../resources/routes.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/shareable_widgets_signin_signup.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildRegisterBody(),
      backgroundColor: ConstantColor.backgroundColor,
    );
  }

  Widget _buildRegisterBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Form(
          key: formKey,
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImage(width: 200.w, height: 200.h),
              const CustomTextAuth(title: "Register To New Account"),
              CustomTextFormField(label: "UserName", icon: Icons.person),
              CustomTextFormField(label: "Email", icon: Icons.email_sharp),
              CustomTextFormField(label: "Phone", icon: Icons.phone_android_rounded),
              CustomTextFormField(label: "Password", icon: Icons.person),
              //
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  maximumSize: Size.fromHeight(150),
                  backgroundColor: ConstantColor.buttonsColor,
                ),
                child: Text("Register", style: TextStyle(color: Colors.white, fontSize: 25.h)),
              ),
              _buildLoginRow()
            ],
          ),
        ),
      ),
    );
  }

  Row _buildLoginRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text("Already have an account?", style: TextStyle(fontSize: 15.sp)),
      TextButton(
        onPressed: () => Get.offNamed(NamedRoutes.loginScreen),
        child: Text("Login", style: TextStyle(fontSize: 16.sp, color: ConstantColor.buttonsColor)),
      )
    ]);
  }
}






 //async {
                  //   if (formKey.currentState!.validate()) {
                  //     // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: SnackBar(content: Text("Login Successfully"))));
                  //     await FirebaseAuth.instance
                  //         .createUserWithEmailAndPassword(email: controller.text, password: passwordController.text);

                  //     Get.toNamed(NamedRoutes.loginScreen);
                  //   }
                  // }



   /************************************************** *
    final isValid = formKey.currentState!.validate();
                    if (!isValid) {
                      return;
                    }
                    try {
                      await supabase.auth.signUp(
                          email: controller.text, password: passwordController.text, data: {'username': usernameController.text});
                      //Get.toNamed(NamedRoutes.loginScreen);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Sign up success")));
                      Get.toNamed(LoginScreen(phoneNumber: phoneController.text).toString());
                    } on AuthException catch (_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Sign up Failed")));
                    } catch (e) {
                      print(e);
                    }
                    Get.toNamed(NamedRoutes.loginScreen);*/
//**********************************************************
    // Future<void> _signUp(String phone) async {
  //   final isValid = formKey.currentState!.validate();
  //   if (!isValid) {
  //     return;
  //   }
  //   final email = controller.text;
  //   final password = passwordController.text;
  //   final username = usernameController.text;
  //   try {
  //     await supabase.auth.signUp(email: email, password: password, data: {'username': username});
  //     //Get.toNamed(NamedRoutes.loginScreen);
  //     Get.toNamed(LoginScreen(phoneNumber:phoneController.text).toString());
  //      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Sign up success")));
  //   } on AuthException catch (e) {
  //     print(e);
  //   } catch (e) {
  //     print(e);
  //   }
  //   Get.toNamed(LoginScreen(phoneNumber:phone).toString());
  //Get.toNamed(NamedRoutes.loginScreen);
  // }             
