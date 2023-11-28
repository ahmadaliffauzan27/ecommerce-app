// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:another_stepper/another_stepper.dart';
import 'package:ecommerce_app/common/components/font_weight.dart';
import 'package:ecommerce_app/common/constants/app_text_style.dart';
import 'package:ecommerce_app/common/extensions/date_time_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/data/models/responses/buyer_order_response_model.dart';
import 'package:ecommerce_app/presentation/order/bloc/cek_resi/cek_resi_bloc.dart';

class ManifestDeliveryPage extends StatefulWidget {
  const ManifestDeliveryPage({
    Key? key,
    required this.buyerOrder,
  }) : super(key: key);
  final BuyerOrder buyerOrder;

  @override
  State<ManifestDeliveryPage> createState() => _ManifestDeliveryPageState();
}

class _ManifestDeliveryPageState extends State<ManifestDeliveryPage> {
  @override
  void initState() {
    context.read<CekResiBloc>().add(CekResiEvent.getCekResi(
        resi: widget.buyerOrder.attributes.noResi,
        courier: widget.buyerOrder.attributes.courierName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<StepperData> stepperData = [];
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Lacak Pengiriman',
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: BlocBuilder<CekResiBloc, CekResiState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return const Center(
                      child: Text('Resi tidak ditemukan'),
                    );
                  },
                  loading: () {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                  loaded: (data) {
                    int indexStep = 0;
                    stepperData = data.rajaongkir.result.manifest.map((e) {
                      indexStep++;
                      return StepperData(
                        title: StepperText(
                          e.manifestCode,
                          textStyle: const TextStyle(color: Colors.grey),
                        ),
                        subtitle: StepperText(
                            '${e.manifestDate.toFormattedDateWithDay()} ${e.manifestTime} \n ${e.manifestDescription}'),
                        iconWidget: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                '$indexStep',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            )),
                      );
                    }).toList();
                    return AnotherStepper(
                      stepperList: stepperData,
                      stepperDirection: Axis.vertical,
                      iconWidth:
                          40, // Height that will be applied to all the stepper icons
                      iconHeight:
                          40, // Width that will be applied to all the stepper icons
                    );
                  },
                  error: (error) {
                    return const Center(
                      child: Text('Resi tidak ditemukan'),
                    );
                  },
                );
              },
            ),
          ),
        ));
  }
}
