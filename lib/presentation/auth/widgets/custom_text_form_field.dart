import 'package:flutter/material.dart';

import '../login/login_controller.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final IconData icon;
  const CustomTextFormField({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: label == "Password",
      validator: (value) => LoginController.validation(value, label),
      decoration: InputDecoration(
        hintMaxLines: 1,
        label: Text(label),
        hintText: "Enter your $label",
        prefixIcon: (label == "Name" || label == "Phone") ? null : Icon(icon),
        suffixIcon: (label == "Password") ? const Icon(Icons.visibility_off_rounded) : null,
      ),
    );
  }
}
