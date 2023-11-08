import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static TextStyle setRegular(TextStyle textStyle) {
    return textStyle.copyWith(fontWeight: FontWeight.normal);
  }

  static TextStyle setMedium(TextStyle textStyle) {
    return textStyle.copyWith(fontWeight: FontWeight.w500);
  }

  static TextStyle setSemiBold(TextStyle textStyle) {
    return textStyle.copyWith(fontWeight: FontWeight.w600);
  }

  static TextStyle setBold(TextStyle textStyle) {
    return textStyle.copyWith(fontWeight: FontWeight.bold);
  }

  // ===== HEADING =====
  static TextStyle heading1 = const TextStyle(
    fontSize: 44.0,
    height: 54 / 44,
    fontFamily: "Poppins",
  );

  static TextStyle heading2 = const TextStyle(
    fontSize: 36.0,
    height: 46 / 36,
    fontFamily: "Poppins",
  );

  static TextStyle heading3 = const TextStyle(
    fontSize: 28.0,
    height: 38 / 28,
    fontFamily: "Poppins",
  );

  static TextStyle heading4 = const TextStyle(
    fontSize: 24.0,
    height: 34 / 24,
    fontFamily: "Poppins",
  );

  static TextStyle heading5 = const TextStyle(
    fontSize: 20.0,
    height: 26 / 20,
    fontFamily: "Poppins",
  );

  // ===== BODY =====
  static TextStyle body1 = const TextStyle(
    fontSize: 18.0,
    height: 27 / 18,
    fontFamily: "Poppins",
  );

  static TextStyle body2 = const TextStyle(
    fontSize: 16.0,
    height: 24 / 16,
    fontFamily: "Poppins",
  );

  static TextStyle body3 = const TextStyle(
    fontSize: 14.0,
    height: 20 / 14,
    fontFamily: "Poppins",
  );

  static TextStyle body4 = const TextStyle(
    fontSize: 12.0,
    height: 18 / 12,
    fontFamily: "Poppins",
  );
}
