import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../resources/constants.dart';
import '../resources/routes.dart';
import 'widgets/custom_text_form_field.dart';
import 'widgets/shareable_widgets_signin_signup.dart';

class LoginScreen extends StatefulWidget {
  final String phoneNumber;
  const LoginScreen({super.key, this.phoneNumber = "01299887463"});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  final supabase = Supabase.instance.client;
  static final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color(0xffECE5DD), body: _buildBody());
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 15.h),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImage(width: 230.w, height: 230.h),
              const CustomTextAuth(title: "Login to your account"),
              CustomTextFormField(labelText: 'Email', icon: Icons.email, emailController: emailController),
              CustomTextFormField(labelText: 'Password', icon: Icons.lock, emailController: passwordController),
              AuthButton(formKey: formKey, label: "login", password: passwordController,email: emailController,),
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
            child: Text("Register", style: TextStyle(fontSize: 16.sp, color: ConstantColor.buttonsColor)))
      ],
    );
  }
}





/**
 *  Future<void> _signIn() async {
    try {
      await supabase.auth.signInWithPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login success")));
      Get.toNamed(ProfileScreen(phoneNumber: widget.phoneNumber).toString());
    } on AuthException catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login failed")));
    } catch (e) {
      print(e);
    }
  }
 */