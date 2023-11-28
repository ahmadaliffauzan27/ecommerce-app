// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/common/components/font_weight.dart';
import 'package:ecommerce_app/common/constants/app_text_style.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/common/components/row_text.dart';
import 'package:ecommerce_app/common/components/space_height.dart';
import 'package:ecommerce_app/common/constants/colors.dart';
import 'package:ecommerce_app/common/constants/images.dart';
import 'package:ecommerce_app/common/extensions/date_time_ext.dart';
import 'package:ecommerce_app/common/extensions/int_ext.dart';
import 'package:ecommerce_app/data/models/responses/buyer_order_response_model.dart';
import 'package:ecommerce_app/presentation/order/model/order_product_model.dart';
import 'package:ecommerce_app/presentation/order/widgets/order_product_tile.dart';
import 'package:ecommerce_app/presentation/order/widgets/order_status.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({
    Key? key,
    required this.buyerOrder,
  }) : super(key: key);
  final BuyerOrder buyerOrder;

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  final List<OrderProductModel> products = [
    OrderProductModel(
      imagePath: Images.product1,
      name: 'Tas Kekinian',
      price: 200000,
    ),
    OrderProductModel(
      imagePath: Images.product2,
      name: 'Earphone',
      price: 199999,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    int totalItem = 0;
    int item = 0;
    // ignore: avoid_function_literals_in_foreach_calls
    widget.buyerOrder.attributes.items.forEach((element) {
      totalItem += element.qty * element.price;
      item += element.qty;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Pesanan',
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
        padding: const EdgeInsets.all(16.0),
        children: [
          const OrderStatus(
            status: ['Pending', 'Dikemas', 'Dikirim'],
          ),
          const SpaceHeight(24.0),
          const Text(
            'Produk',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          const SpaceHeight(14.0),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.buyerOrder.attributes.items.length,
            itemBuilder: (context, index) => OrderProductTile(
              data: widget.buyerOrder.attributes.items[index],
            ),
          ),
          const SpaceHeight(24.0),
          const Text(
            'Detail Pengiriman',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          const SpaceHeight(14.0),
          Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(color: ColorName.border),
            ),
            child: Column(
              children: [
                RowText(
                    label: 'Waktu Pengiriman',
                    value: widget.buyerOrder.attributes.createdAt
                        .toFormattedDateWithDay()),
                const SpaceHeight(12.0),
                RowText(
                  label: 'Ekspedisi Pengiriman',
                  value: widget.buyerOrder.attributes.courierName,
                ),
                const SpaceHeight(12.0),
                RowText(
                  label: 'No. Resi',
                  value: widget.buyerOrder.attributes.noResi,
                ),
                const SpaceHeight(12.0),
                RowText(
                  label: 'Alamat',
                  value: widget.buyerOrder.attributes.deliveryAddress,
                ),
              ],
            ),
          ),
          const SpaceHeight(24.0),
          const Text(
            'Detail Pembayaran',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          const SpaceHeight(14.0),
          Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(color: ColorName.border),
            ),
            child: Column(
              children: [
                RowText(
                    label: 'Total Item ($item)',
                    value: totalItem.currencyFormatRp),
                const SpaceHeight(12.0),
                RowText(
                    label: 'Ongkir',
                    value: widget
                        .buyerOrder.attributes.courierPrice.currencyFormatRp),
                const SpaceHeight(12.0),
                RowText(
                  label: 'Total ',
                  value:
                      widget.buyerOrder.attributes.totalPrice.currencyFormatRp,
                  valueColor: ColorName.primary,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
