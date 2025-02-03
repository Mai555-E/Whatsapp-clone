import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:whatsapp_clone_app/presentation/resources/routes.dart';

import '../../resources/constants.dart';
import '../../resources/images.dart';

class AuthButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String label;
  final TextEditingController email, password;
  const AuthButton({super.key, required this.formKey, required this.label, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            if (label == "Register") {
              try {
                await Supabase.instance.client.auth.signUp(password: password.text, email: email.text);

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("sign up success")));
                Get.toNamed(NamedRoutes.loginScreen);
              } on AuthApiException catch (error) {
                print(error.message);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("sign up Failed")));
              }
            } else {
              try {
                await Supabase.instance.client.auth.signInWithPassword(password: password.text, email: email.text);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("sign in success")));
                Get.toNamed(NamedRoutes.mainView);
              } on AuthApiException catch (error) {
                print(error.message);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("sign in Failed")));
              }
            }
          }
        },
        style: ElevatedButton.styleFrom(
            maximumSize: Size.fromHeight(150), minimumSize: Size.fromHeight(50), backgroundColor: ConstantColor.buttonsColor),
        child: Text(label, style: TextStyle(color: Colors.white, fontSize: 25.h)));
  }
}

//*********************************************************** */
// image
class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.width, required this.height});
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(NamedImages.logo, width: width, height: height);
  }
}

//****************************************************************** */
// text Auth
class CustomTextAuth extends StatelessWidget {
  const CustomTextAuth({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500), textAlign: TextAlign.center);
  }
}
