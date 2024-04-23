import 'package:flutter/material.dart';
import 'package:mystarship/tools/constants.dart';

class CustomTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final double widthRatio;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.widthRatio,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32 * widthRatio),
      child: TextField(
        style: TextStyle(fontSize: 18 * widthRatio, color: lightColor),
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: activeColor)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: selectedColor)),
          fillColor: offsetPrimaryColor,
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(color: subColor),
        ),
      ),
    );
  }
}
