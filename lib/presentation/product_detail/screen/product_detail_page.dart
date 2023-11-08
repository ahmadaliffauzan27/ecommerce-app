import 'package:ecommerce_app/data/models/responses/products_response_model.dart';
import 'package:ecommerce_app/presentation/product_detail/screen/product_detail_view.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ProductDetailView(
      product: product,
    );
  }
}
