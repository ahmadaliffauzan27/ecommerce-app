import 'package:ecommerce_app/common/components/font_weight.dart';
import 'package:ecommerce_app/common/constants/app_text_style.dart';
import 'package:ecommerce_app/common/constants/colors.dart';
import 'package:ecommerce_app/common/gen/assets.gen.dart';
import 'package:ecommerce_app/data/datasource/auth_local_datasource.dart';
import 'package:ecommerce_app/data/models/responses/auth_response_model.dart';
import 'package:ecommerce_app/presentation/auth/login/screen/login_page.dart';
import 'package:ecommerce_app/presentation/order/page/order_page/order_page.dart';
import 'package:ecommerce_app/presentation/shipping_address/page/shipping_address/screen/shipping_address_view.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  Future<void> _initUser() async {
    final user = await AuthLocalDataSource().getUser();
    setState(() {
      _user = user;
    });
  }

  User? _user;

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      _initUser();
    }
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: 150,
            color: PrimaryColor.pr10,
            child: Stack(
              children: [
                SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Assets.images.ornamen.image(
                      fit: BoxFit.cover,
                    )),
                Stack(
                  // fit: StackFit.loose,
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 80,
                      child: Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(12),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100)),
                              child: Assets.images.avatar.image(height: 100)),
                          Text(
                            // 'Ahmad Alif Fauzan',
                            _user?.username ?? 'Guest',
                            style: AppTextStyle.body2
                                .copyWith(color: PrimaryColor.pr10)
                                .semiBold,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 150, 16, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrderPage()),
                    );
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(0, 3))
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pesanan',
                            style: AppTextStyle.body3.medium,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ShippingAddressPage()),
                    );
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(0, 3))
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Alamat',
                            style: AppTextStyle.body3.medium,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () async {
                    await AuthLocalDataSource().removeData();
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(0, 3))
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Logout',
                            style: AppTextStyle.body3.medium,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    )
        // ListView(
        //   children: [
        //     ListTile(
        //       leading: Assets.icons.user.image(),
        //       title: const Text(
        //         'Profil',
        //         style: TextStyle(
        //           color: ColorName.primary,
        //           fontWeight: FontWeight.w700,
        //         ),
        //       ),
        //       onTap: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (context) => const ProfilePage()),
        //         );
        //       },
        //     ),
        //     ListTile(
        //       leading: Assets.icons.bag.image(),
        //       title: const Text(
        //         'Pesanan',
        //         style: TextStyle(
        //           color: ColorName.primary,
        //           fontWeight: FontWeight.w700,
        //         ),
        //       ),
        //       onTap: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (context) => const OrderPage()),
        //         );
        //       },
        //     ),
        //     ListTile(
        //       leading: Assets.icons.bag.image(),
        //       title: const Text(
        //         'Alamat',
        //         style: TextStyle(
        //           color: ColorName.primary,
        //           fontWeight: FontWeight.w700,
        //         ),
        //       ),
        //       onTap: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //               builder: (context) => const ShippingAddressPage()),
        //         );
        //       },
        //     ),
        //     ListTile(
        //       leading: Assets.icons.bag.image(),
        //       title: const Text(
        //         'Logout',
        //         style: TextStyle(
        //           color: ColorName.primary,
        //           fontWeight: FontWeight.w700,
        //         ),
        //       ),
        //       onTap: () async {
        //         await AuthLocalDataSource().removeData();
        //         // ignore: use_build_context_synchronously
        //         Navigator.pushReplacement(context,
        //             MaterialPageRoute(builder: (context) => const LoginPage()));
        //       },
        //     ),
        //   ],
        // ),
        );
  }
}
