import 'package:ecommerce_app/common/components/font_weight.dart';
import 'package:ecommerce_app/common/constants/app_text_style.dart';
import 'package:ecommerce_app/common/extensions/int_ext.dart';
import 'package:ecommerce_app/data/models/responses/products_response_model.dart';
import 'package:flutter/material.dart';

import '../../../common/components/space_height.dart';
import '../../../common/constants/colors.dart';

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({
    Key? key,
    required this.padding,
    required this.product,
    required this.onWishlistTap,
  }) : super(key: key);
  final EdgeInsetsGeometry padding;
  final Product product;
  final void Function(bool isWishlist) onWishlistTap;

  @override
  Widget build(BuildContext context) {
    bool isWishlist = false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.attributes.name,
                style: AppTextStyle.body1.semiBold,
              ),
              StatefulBuilder(
                builder: (context, setState) {
                  return IconButton(
                    onPressed: () {
                      isWishlist = !isWishlist;
                      setState(() {});
                      onWishlistTap(isWishlist);
                    },
                    icon: isWishlist
                        ? const Icon(
                            Icons.favorite,
                            color: ColorName.red,
                          )
                        : const Icon(Icons.favorite_border),
                    iconSize: 24.0,
                  );
                },
              ),
            ],
          ),
        ),
        const SpaceHeight(4.0),
        Padding(
          padding: padding,
          child: Text(
            int.parse(product.attributes.price.toString()).currencyFormatRp,
            style: AppTextStyle.body2.semiBold.copyWith(
              color: PrimaryColor.pr10,
            ),
          ),
        )
      ],
    );
  }
}
