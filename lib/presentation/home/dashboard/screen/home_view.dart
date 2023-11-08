import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/common/components/font_weight.dart';
import 'package:ecommerce_app/common/components/space_height.dart';
import 'package:ecommerce_app/common/constants/app_text_style.dart';
import 'package:ecommerce_app/common/constants/colors.dart';
import 'package:ecommerce_app/common/constants/images.dart';
import 'package:ecommerce_app/presentation/cart/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_app/presentation/cart/screen/cart_page.dart';
import 'package:ecommerce_app/presentation/home/dashboard/widgets/carousel_sertifikat_one.dart';
import 'package:ecommerce_app/presentation/home/dashboard/widgets/carousel_sertifikat_three.dart';
import 'package:ecommerce_app/presentation/home/dashboard/widgets/carousel_sertifikat_two.dart';
import 'package:ecommerce_app/presentation/home/dashboard/widgets/container_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as badges;

import '../../bloc/product/product_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  final CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  color: PrimaryColor.pr10,
                  height: 240,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 64, 16, 0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 35,
                                  width: 2,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: null,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Alamat Pengiriman',
                                      style: AppTextStyle.body4.medium
                                          .copyWith(color: Colors.white),
                                    ),
                                    Text(
                                      'Cirebon, Jawa Barat',
                                      style: AppTextStyle.body4.regular
                                          .copyWith(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            badges.Badge(
                              badgeContent: BlocBuilder<CartBloc, CartState>(
                                builder: (context, state) {
                                  return state.maybeWhen(orElse: () {
                                    return const Text('0');
                                  }, success: (carts) {
                                    int totalQty = 0;
                                    for (var cart in carts) {
                                      totalQty += cart.quantity;
                                    }
                                    return Text(
                                      totalQty.toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    );
                                  });
                                },
                              ),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CartPage()),
                                    );
                                  },
                                  icon: Image.asset(
                                    Images.iconBuy,
                                    height: 24.0,
                                    color: Colors.white,
                                  )),
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SizedBox()),
                                  );
                                },
                                icon: Image.asset(
                                  Images.iconNotificationHome,
                                  color: Colors.white,
                                  height: 24.0,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Image.asset(
                    'assets/images/ornamen.png',
                    width: 180,
                    height: 135,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150.0),
                  child: Column(
                    children: [
                      CarouselSlider(
                        carouselController: _carouselController,
                        options: CarouselOptions(
                            enlargeCenterPage: false,
                            enableInfiniteScroll: true,
                            height: 170,
                            aspectRatio: 16 / 9,
                            scrollDirection: Axis.horizontal,
                            viewportFraction: 1,
                            pauseAutoPlayOnTouch: true,
                            autoPlay: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentIndex = index;
                              });
                            }),
                        items: const [
                          CarouselSertifikatOne(),
                          CarouselSertifikatTwo(),
                          CarouselSertifikatThree(),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          return Container(
                            width: 8,
                            height: 8,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentIndex == index
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ],
            ),
            // Container(
            //   color: Colors.white,
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 16),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         const SizedBox(
            //           height: 50,
            //         ),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Text(
            //               'Kategori',
            //               style: AppTextStyle.body3.semiBold,
            //             ),
            //             Text(
            //               'Lihat Semua ',
            //               style: AppTextStyle.body3.regular,
            //             ),
            //           ],
            //         ),
            //         const SizedBox(
            //           height: 16,
            //         ),
            //         const FiturLxp()
            //       ],
            //     ),
            //   ),
            // ),
            const SpaceHeight(30.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Produk',
                    style: AppTextStyle.body3.semiBold,
                  ),
                  Text(
                    'Lihat Semua ',
                    style: AppTextStyle.body3.regular,
                  ),
                ],
              ),
            ),
            const SpaceHeight(8.0),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                return state.maybeWhen(orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }, loaded: (model) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 15.0,
                      ),
                      itemCount: model.data.length,
                      itemBuilder: (context, index) => ContainerProduct(
                        data: model.data[index],
                      ),
                    ),
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
