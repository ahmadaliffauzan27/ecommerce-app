import 'package:ecommerce_app/common/constants/app_text_style.dart';
import 'package:flutter/material.dart';

extension SetFontWeight on TextStyle {
  TextStyle get regular => AppTextStyle.setRegular(this);
  TextStyle get medium => AppTextStyle.setMedium(this);
  TextStyle get semiBold => AppTextStyle.setSemiBold(this);
  TextStyle get bold => AppTextStyle.setBold(this);
}
