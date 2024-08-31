import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {super.key, this.controller, this.maxLines = 1, this.hintText});
  final TextEditingController? controller;
  final int maxLines;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(
        color: CustomColor.scaffoldBg,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: CustomColor.whiteSecondary,
        focusedBorder: getInputBorder,
        enabledBorder: getInputBorder,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: CustomColor.scaffoldBg,
        ),
      ),
    );
  }

  OutlineInputBorder get getInputBorder {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none,
    );
  }
}
