import 'package:flutter/material.dart';

import '../../../data/app_api.dart';

class LoginController {
  static final formKey = GlobalKey<FormState>();
  static final _emailPasswordLogin = EmailPasswordLogin();

  static String? validation(String? value, String label) {
    if (value != null) {
      switch (label) {
        case "Email":
          if (value.isEmpty) {
            return "Email is required";
          } else if (!RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
            return "please enter a valid email";
          } else {
            _emailPasswordLogin.email = value;
          }

        case "Password":
          if (value.isEmpty) {
            return "password is required";
          } else if (value.length < 8) {
            return 'please enter a valid password';
          } else {
            _emailPasswordLogin.password = value;
          }
      }
    } else {
      return "Field can't be empty";
    }
    return null;
  }

  static Future<bool> login() async {
    return await AppServiceClient.login(_emailPasswordLogin);
  }
}

/*
  case "UserName":
    if (value.isEmpty) {
      return "username is required";
    } else if (!RegExp(r'^[a-zA-Z0-9_]{3,20}$').hasMatch(value)) {
      return 'Username can only contain letters, numbers, and underscores (3-10 characters)';
    }
*/
