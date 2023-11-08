import 'package:ecommerce_app/common/components/font_weight.dart';
import 'package:ecommerce_app/common/constants/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../../common/components/space_height.dart';

class ProductDescriptionWidget extends StatelessWidget {
  const ProductDescriptionWidget({
    Key? key,
    required this.padding,
    required this.description,
  }) : super(key: key);

  final EdgeInsetsGeometry padding;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: padding,
          child: Text(
            "Deskripsi Produk",
            style: AppTextStyle.body3.semiBold,
          ),
        ),
        const SpaceHeight(11.0),
        Padding(
          padding: padding,
          child: Text(
            description,
            style: AppTextStyle.body4.regular,
            textAlign: TextAlign.justify,
          ),
        )
      ],
    );
  }
}
