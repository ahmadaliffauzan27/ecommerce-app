import 'package:ecommerce_app/data/datasource/auth_local_datasource.dart';
import 'package:ecommerce_app/presentation/auth/bloc/login/login_bloc.dart';
import 'package:ecommerce_app/presentation/auth/bloc/register/register_bloc.dart';
import 'package:ecommerce_app/presentation/auth/login/screen/login_page.dart';
import 'package:ecommerce_app/presentation/cart/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_app/presentation/cart/bloc/order/order_bloc.dart';
import 'package:ecommerce_app/presentation/home/bloc/product/product_bloc.dart';
import 'package:ecommerce_app/presentation/home/navbar/screen/navbar_page.dart';
import 'package:ecommerce_app/presentation/payment/bloc/order_detail/order_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) =>
              ProductBloc()..add(const ProductEvent.getAllProduct()),
        ),
        BlocProvider(
          create: (context) => CartBloc(),
        ),
        BlocProvider(
          create: (context) => OrderBloc(),
        ),
        BlocProvider(
          create: (context) => OrderDetailBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder<bool>(
          future: AuthLocalDataSource().isLogin(),
          builder: (context, snapshot) {
            if (snapshot.data != null && snapshot.data!) {
              return const NavbarPage();
            } else {
              return const LoginPage();
            }
          },
        ),
      ),
    );
  }
}
