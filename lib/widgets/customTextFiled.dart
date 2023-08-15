import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData? icon;
  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomTextField({
    required this.hintText,
    required this.controller,
    this.icon,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.8),
        ),
        prefixIcon: icon != null
            ? Icon(
                icon,
                color: Colors.white.withOpacity(0.8),
              )
            : null,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(0.8)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      validator: validator,
    );
  }
}
