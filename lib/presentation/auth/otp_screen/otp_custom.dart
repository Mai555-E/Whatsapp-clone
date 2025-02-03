import '../../resources/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'controller.dart';

class OTP extends StatefulWidget {
  final bool first;
  final bool last;
  final TextEditingController phoneController;
  const OTP({super.key, required this.first, required this.last, required this.phoneController});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  @override
  void dispose() {
    c1.dispose();
    c2.dispose();
    c3.dispose();
    c4.dispose();
    c5.dispose();
    c6.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: MediaQuery.sizeOf(context).width / 7,
      child: TextField(
        onChanged: (value) {
          if (value.isNotEmpty && widget.last == false) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && widget.first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 17),
        decoration: const InputDecoration(
            hintText: "-",
            enabled: true,
            focusColor: ConstantColor.secondaryColor,
            focusedErrorBorder:
                OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12)), borderSide: BorderSide(color: Colors.red)),
            errorBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12)), borderSide: BorderSide(color: Colors.red)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)), borderSide: BorderSide(color: ConstantColor.secondaryColor)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ConstantColor.secondaryColor), borderRadius: BorderRadius.all(Radius.circular(12))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)), borderSide: BorderSide(color: ConstantColor.secondaryColor))),
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
      ),
    );
  }
}
