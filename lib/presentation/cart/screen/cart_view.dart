import 'package:ecommerce_app/common/components/button.dart';
import 'package:ecommerce_app/common/components/custom_dropdown.dart';
import 'package:ecommerce_app/common/components/font_weight.dart';
import 'package:ecommerce_app/common/components/row_text.dart';
import 'package:ecommerce_app/common/components/space_height.dart';
import 'package:ecommerce_app/common/constants/app_text_style.dart';
import 'package:ecommerce_app/common/constants/colors.dart';
import 'package:ecommerce_app/common/extensions/int_ext.dart';
import 'package:ecommerce_app/data/models/requests/order_request_model.dart';
import 'package:ecommerce_app/presentation/cart/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_app/presentation/cart/bloc/order/order_bloc.dart';
import 'package:ecommerce_app/presentation/cart/widgets/cart_tile.dart';
import 'package:ecommerce_app/presentation/payment/screen/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
  }

  List<Item> items = [];
  int localTotalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Keranjang',
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
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                success: (carts) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        const SpaceHeight(16.0),
                    itemCount: carts.length,
                    itemBuilder: (context, index) {
                      return CartItemWidget(
                        data: carts[index],
                      );
                    },
                  );
                },
              );
            },
          ),
          const SpaceHeight(16.0),

          Button.filled(
            width: 60,
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => const ShippingAddressPage()),
              // );
            },
            label: 'Pilih Alamat Pengiriman',
          ),
          const SpaceHeight(16.0),
          // show alamat pengiriman
          // if (carts.isNotEmpty)
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(color: NeutralColor.ne04),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Alamat Pengiriman',
                  style: AppTextStyle.body4.semiBold,
                ),
                const SpaceHeight(16.0),
                Text(
                  'Nama Lengkap',
                  style: AppTextStyle.body4.regular,
                ),
                const SpaceHeight(8.0),
                Text(
                  'Alamat Lengkap',
                  style: AppTextStyle.body4.regular,
                ),
                const SpaceHeight(8.0),
                Text(
                  'Kota, Provinsi, Kode Pos',
                  style: AppTextStyle.body4.regular,
                ),
                const SpaceHeight(8.0),
                Text(
                  'No Handphone',
                  style: AppTextStyle.body4.regular,
                ),
              ],
            ),
          ),
          const SpaceHeight(16.0),
          //container for dropdown courier
          // if (carts.isNotEmpty)
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(color: NeutralColor.ne04),
            ),
            child: CustomDropdown(
              value: 'JNE',
              items: const ['JNE', 'J&T'],
              label: 'Kurir',
              onChanged: (value) {},
            ),
          ),
          const SpaceHeight(16.0),
          // if (carts.isNotEmpty)
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(color: NeutralColor.ne04),
            ),
            child: Column(
              children: [
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return RowText(
                          label: 'Total',
                          value: 0.currencyFormatRp,
                        );
                      },
                      success: (carts) {
                        int totalPrice = 0;
                        for (var element in carts) {
                          totalPrice += int.parse(
                                  element.product.attributes.price.toString()) *
                              element.quantity;
                        }
                        localTotalPrice = totalPrice;
                        items = carts
                            .map((e) => Item(
                                id: e.product.id,
                                productName: e.product.attributes.name,
                                qty: e.quantity,
                                price: int.parse(
                                    e.product.attributes.price.toString())))
                            .toList();
                        return RowText(
                          label: 'Total',
                          value: totalPrice.currencyFormatRp,
                          valueColor: PrimaryColor.pr10,
                          fontWeight: FontWeight.w700,
                        );
                      },
                    );
                  },
                ),
                const SpaceHeight(12.0),
                const RowText(
                  label: 'Biaya Pengiriman',
                  value: 'Free Ongkir', //150000.currencyFormatRp,
                ),
                const SpaceHeight(40.0),
                Divider(color: NeutralColor.ne04),
                const SpaceHeight(12.0),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return RowText(
                          label: 'Total Harga',
                          value: 0.currencyFormatRp,
                        );
                      },
                      success: (carts) {
                        int totalPrice = 0;
                        for (var element in carts) {
                          totalPrice += int.parse(
                                  element.product.attributes.price.toString()) *
                              element.quantity;
                        }
                        return RowText(
                          label: 'Total Harga',
                          value: totalPrice.currencyFormatRp,
                          valueColor: PrimaryColor.pr10,
                          fontWeight: FontWeight.w700,
                        );
                      },
                    );
                  },
                ),
                const SpaceHeight(16.0),
                BlocConsumer<OrderBloc, OrderState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () {},
                      success: (response) {
                        context.read<CartBloc>().add(const CartEvent.started());
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return PaymentPage(
                            invoiceUrl: response.invoiceUrl,
                            orderId: response.externalId,
                          );
                        }));
                      },
                    );
                  },
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return Button.filled(
                          onPressed: () {
                            context.read<OrderBloc>().add(
                                  OrderEvent.order(
                                    OrderRequestModel(
                                        data: Data(
                                            items: items,
                                            totalPrice: localTotalPrice,
                                            deliveryAddress: 'Cirebon, plered',
                                            courierName: 'JNE',
                                            courierPrice: 0,
                                            status: 'waiting-payment')),
                                  ),
                                );
                          },
                          label: 'Bayar Sekarang',
                        );
                      },
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
