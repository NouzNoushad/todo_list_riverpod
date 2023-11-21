import 'package:flutter/material.dart';

OutlineInputBorder get kOutlineInputBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(width: 1, color: Colors.white));

OutlineInputBorder get kOutlineErrorBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(width: 1, color: Colors.red));

TextStyle get kTitleTextStyle => const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
