import 'package:flutter/material.dart';
import '../base/controller.dart';

import '../base/validation.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final IconData icon;
  final AuthController controller;
  const CustomTextFormField({super.key, required this.icon, required this.label, required this.controller});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isObscured = true;
  late final Validation _validation;
  late final TextEditingController _controller;

  bool get _isPassword => widget.label.toLowerCase().contains("password");

  IconButton _buildObscureEye() {
    return IconButton(
        onPressed: () => setState(() => _isObscured = !_isObscured),
        icon: Icon(_isObscured ? Icons.visibility_off_rounded : Icons.visibility_rounded));
  }

  bool isObscured() => (!_isPassword) ? _isPassword : _isPassword == _isObscured;

  @override
  void initState() {
    super.initState();
    _validation = Validation.fromLabel(widget.label);
    _controller = widget.controller.controllers[widget.label]!;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      obscureText: _isObscured,
      validator: _validation.validateAll,
      decoration: InputDecoration(
        hintMaxLines: 1,
        label: Text(widget.label),
        prefixIcon: Icon(widget.icon),
        hintText: "Enter your ${widget.label}",
        suffixIcon: _isPassword ? _buildObscureEye() : null,
      ),
    );
  }
}
