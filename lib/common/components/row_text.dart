import 'package:ecommerce_app/common/components/font_weight.dart';
import 'package:ecommerce_app/common/constants/app_text_style.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class RowText extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;
  final FontWeight fontWeight;

  const RowText({
    super.key,
    required this.label,
    required this.value,
    this.valueColor = ColorName.black,
    this.fontWeight = FontWeight.w400,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyle.body4.semiBold),
        Flexible(
          child: Text(
            value,
            style: AppTextStyle.body4.regular.copyWith(
              color: valueColor,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ],
    );
  }
}
