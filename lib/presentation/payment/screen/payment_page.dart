import 'package:ecommerce_app/presentation/payment/screen/payment_view.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  final String invoiceUrl;
  final String orderId;
  const PaymentPage({
    super.key,
    required this.invoiceUrl,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentView(
      invoiceUrl: invoiceUrl,
      orderId: orderId,
    );
  }
}
