import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommerce_app/common/components/font_weight.dart';
import 'package:ecommerce_app/common/constants/app_text_style.dart';
import 'package:ecommerce_app/presentation/home/navbar/screen/navbar_page.dart';

import 'package:flutter/material.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'Pembayaran Sukses',
        titleTextStyle: AppTextStyle.body4.semiBold,
        desc: 'Selamat Pembayaran Berhasil dilakukan',
        descTextStyle: AppTextStyle.body4.regular,
        btnOkOnPress: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const NavbarPage();
          }));
        },
      ).show();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
