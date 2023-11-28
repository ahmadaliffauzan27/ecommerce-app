import 'package:ecommerce_app/common/components/font_weight.dart';
import 'package:ecommerce_app/common/components/space_height.dart';
import 'package:ecommerce_app/common/constants/app_text_style.dart';
import 'package:ecommerce_app/presentation/order/bloc/buyer_order/buyer_order_bloc.dart';
import 'package:ecommerce_app/presentation/order/model/transaction_model.dart';
import 'package:ecommerce_app/presentation/order/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final List<TransactionModel> transactions = [
    TransactionModel(
      noResi: 'QQNSU346JK',
      status: 'Dikirim',
      quantity: 2,
      price: 1900000,
    ),
    TransactionModel(
      noResi: 'SDG1345KJD',
      status: 'Diterima',
      quantity: 2,
      price: 900000,
    ),
  ];

  @override
  void initState() {
    context.read<BuyerOrderBloc>().add(const BuyerOrderEvent.getOrder());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pesanan',
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
      body: BlocBuilder<BuyerOrderBloc, BuyerOrderState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SpaceHeight(0.0),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loaded: (orders) {
              if (orders.isEmpty) {
                return const Center(
                  child: Text('Tidak ada data'),
                );
              }
              return ListView.separated(
                padding: const EdgeInsets.all(16.0),
                separatorBuilder: (context, index) => const SpaceHeight(16.0),
                itemCount: orders.length,
                itemBuilder: (context, index) => OrderCard(
                  data: orders[index],
                ),
              );
            },
            error: (message) => Center(
              child: Text(message),
            ),
          );
          // return ListView.separated(
          //   padding: const EdgeInsets.all(16.0),
          //   separatorBuilder: (context, index) => const SpaceHeight(16.0),
          //   itemCount: transactions.length,
          //   itemBuilder: (context, index) => OrderCard(
          //     data: transactions[index],
          //   ),
          // );
        },
      ),
    );
  }
}
