import 'package:flutter/material.dart';

import 'constants.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      //
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(color: Colors.grey),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        errorBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
        enabledBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: ConstantColor.buttonsColor, width: 2)),
      ),
    );
  }
}
