import 'package:flutter/material.dart';

import 'constants.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Color(0xfff4f4f4),
   appBarTheme: AppBarTheme( 
      backgroundColor: Color(0xfff4f4f4),
      centerTitle: true,

      iconTheme: IconThemeData(
        color: Colors.black,
        size: 20

      )
   ),

///
///
 
/// 
/// 
   dividerTheme: DividerThemeData( 
    color: Color(0xffefefef)
   ),
     cardTheme: CardTheme( 
      color: Colors.white
      
     ), 
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
