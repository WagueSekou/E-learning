import 'package:flutter/material.dart';

class AppTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final double width;
  const AppTextfield(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      this.width = 350});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey[500],
          ),
        ),
      ),
    );
  }
}
