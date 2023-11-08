// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/common/extensions/int_ext.dart';
import 'package:ecommerce_app/data/models/responses/products_response_model.dart';

class CartModel {
  final Product product;
  int quantity;

  CartModel({
    required this.product,
    this.quantity = 0,
  });

  String get priceFormat => product.attributes.price.currencyFormatRp;
}
