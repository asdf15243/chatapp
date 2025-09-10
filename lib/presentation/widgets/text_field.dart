import 'package:flutter/material.dart';
import 'color_palette.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;

  const CustomTextField({super.key, required this.hintText, this.controller});

  static InputDecoration getDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: ColorPalette.textSecondary),
      filled: true,
      fillColor: ColorPalette.background,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: ColorPalette.inputBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: ColorPalette.inputBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: ColorPalette.inputBorder),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(color: ColorPalette.textPrimary),
      decoration: getDecoration(hintText),
      cursorColor: ColorPalette.textPrimary,
    );
  }
}
