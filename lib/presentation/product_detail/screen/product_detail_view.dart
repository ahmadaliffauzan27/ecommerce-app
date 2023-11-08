import 'package:ecommerce_app/common/components/button.dart';
import 'package:ecommerce_app/common/components/font_weight.dart';
import 'package:ecommerce_app/common/components/space_height.dart';
import 'package:ecommerce_app/common/constants/app_text_style.dart';
import 'package:ecommerce_app/common/constants/colors.dart';
import 'package:ecommerce_app/common/constants/variables.dart';
import 'package:ecommerce_app/data/models/responses/products_response_model.dart';
import 'package:ecommerce_app/presentation/cart/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_app/presentation/cart/screen/cart_page.dart';
import 'package:ecommerce_app/presentation/cart/widgets/cart_model.dart';
import 'package:ecommerce_app/presentation/home/dashboard/widgets/image_slider.dart';
import 'package:ecommerce_app/presentation/product_detail/widgets/product_description.dart';
import 'package:ecommerce_app/presentation/product_detail/widgets/product_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  EdgeInsets paddingHorizontal = const EdgeInsets.symmetric(horizontal: 20.0);

  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = widget.product.attributes.images.data
        .map((image) => '${Variables.baseUrl}${image.attributes.url}')
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Produk',
          style: AppTextStyle.body2.semiBold,
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 16,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: ListView(
        children: [
          ImageSlider(items: imageUrls),
          const SpaceHeight(16.0),
          ProductInfoWidget(
            padding: paddingHorizontal,
            product: widget.product,
            onWishlistTap: (isWishlist) {},
          ),
          const SpaceHeight(11.0),
          ProductDescriptionWidget(
            padding: paddingHorizontal,
            description: widget.product.attributes.description,
          ),
          const SpaceHeight(11.0),
          Padding(
            padding: paddingHorizontal,
            child: Divider(
              color: ColorName.grey.withOpacity(0.18),
            ),
          ),
          const SpaceHeight(11.0),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.withOpacity(0.18)),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Button.filled(
                onPressed: () {
                  context.read<CartBloc>().add(CartEvent.add(
                      CartModel(product: widget.product, quantity: 1)));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartPage()),
                  );
                },
                label: "+ Keranjang",
              ),
            ),
            const SpaceWidth(15.0),
            Flexible(
              child: Button.outlined(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const PaymentPage()),
                  // );
                },
                label: "Beli",
                color: ColorName.light,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
