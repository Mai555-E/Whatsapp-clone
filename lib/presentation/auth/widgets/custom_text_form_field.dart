import 'package:flutter/material.dart';

import '../../resources/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final IconData icon;
  final String labelText;
  final TextEditingController emailController;
  static final RegExp _usernameRegExp = RegExp(r'^[a-zA-Z0-9_]{3,20}$');
  static final RegExp emailRegExp = RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  ///static final TextEditingController controller = TextEditingController();
  const CustomTextFormField({super.key, required this.icon, required this.labelText, required this.emailController});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: emailController,
        obscureText: (labelText == "Password") ? true : false,
        decoration: InputDecoration(
            enabled: true,
            hintMaxLines: 1,
            label: Text(labelText),
            hintText: "Enter your $labelText",
            prefixIcon: (labelText == "Name" || labelText == "Phone") ? null : Icon(icon),
            hintStyle: const TextStyle(color: Colors.grey),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: (labelText == "Password") ? const Icon(Icons.visibility_off_rounded) : null,
            errorBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
            enabledBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
            focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: ConstantColor.buttonsColor, width: 2))),
        validator: _validateFormField);
  }

  String? _validateFormField(String? value) {
    String label = labelText;
    switch (label) {
      case "Email":
        if (label.isEmpty) {
          return "Email is required";
        } else if (emailRegExp.hasMatch(label)) {
          return "please enter a valid email";
        }

      case "UserName":
        if (label.isEmpty) {
          return "username is required";
        } else if (!_usernameRegExp.hasMatch(label)) {
          return 'Username can only contain letters, numbers, and underscores (3-10 characters)';
        }

      case "Password":
        if (label.isEmpty) {
          return "password is required";
        } else if (label.length < 8) {
          return 'please enter a valid password';
        }
    }
    return null;

    /*Please enter some text*/
    //return "";
  }
}
