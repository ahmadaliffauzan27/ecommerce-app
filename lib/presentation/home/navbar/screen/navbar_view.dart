import 'package:ecommerce_app/common/components/font_weight.dart';
import 'package:ecommerce_app/common/constants/app_text_style.dart';
import 'package:ecommerce_app/presentation/cart/bloc/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as badges;
import 'package:ecommerce_app/common/constants/images.dart';
import 'package:ecommerce_app/common/constants/colors.dart';
import 'package:ecommerce_app/presentation/account/page/Account/account_page.dart';
import 'package:ecommerce_app/presentation/cart/screen/cart_page.dart';
import 'package:ecommerce_app/presentation/home/dashboard/screen/home_page.dart';

class NavbarView extends StatefulWidget {
  const NavbarView({super.key});

  @override
  State<NavbarView> createState() => _NavbarViewState();
}

class _NavbarViewState extends State<NavbarView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const CartPage(),
    const AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CartBloc(), // Replace with the actual initialization of your CartBloc
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: AppTextStyle.body4.semiBold,
          unselectedLabelStyle: AppTextStyle.body4.semiBold,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: PrimaryColor.pr10,
          onTap: _onItemTapped,
          items: [
            const BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Images.iconHome)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: badges.Badge(
                badgeContent: BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => const Text('0'),
                      success: (carts) {
                        int totalQty = 0;
                        for (var cart in carts) {
                          totalQty += cart.quantity;
                        }
                        return Text(
                          totalQty.toString(),
                          style: const TextStyle(color: Colors.white),
                        );
                      },
                    );
                  },
                ),
                child: const ImageIcon(
                  AssetImage(Images.iconCart),
                  color: Colors.black,
                ),
              ),
              label: 'Cart',
            ),
            const BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Images.iconUser)),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
