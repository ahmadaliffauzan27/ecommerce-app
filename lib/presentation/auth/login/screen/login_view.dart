import 'package:ecommerce_app/common/components/font_weight.dart';
import 'package:ecommerce_app/common/components/space_height.dart';
import 'package:ecommerce_app/common/components/text_field.dart';
import 'package:ecommerce_app/common/constants/app_text_style.dart';
import 'package:ecommerce_app/common/constants/colors.dart';
import 'package:ecommerce_app/presentation/auth/login/widgets/forgot_password_button.dart';
import 'package:ecommerce_app/presentation/auth/login/widgets/login_email_password_button.dart';
import 'package:ecommerce_app/presentation/auth/login/widgets/register_button.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isPasswordObscured = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordObscured = !_isPasswordObscured;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SpaceHeight(80.0),
          Text(
            "Masuk",
            textAlign: TextAlign.center,
            style: AppTextStyle.heading5.semiBold,
          ),
          const SizedBox(height: 8.0),
          Text(
            "Masukkan Akun Kamu",
            textAlign: TextAlign.center,
            style: AppTextStyle.body2.copyWith(color: NeutralColor.ne05),
          ),
          const SizedBox(height: 32.0),
          KgTextField(
            labelText: 'Email',
            hintText: 'Masukkan email kamu',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            controller: emailController,
            onChanged: (value) {
              emailController.text = value;
            },
          ),
          const SizedBox(height: 16.0),
          KgTextField(
            labelText: 'Kata Sandi',
            hintText: 'Masukkan kata sandi kamu',
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
            obscureText: _isPasswordObscured,
            suffixIcon: IconButton(
              onPressed: () {
                _togglePasswordVisibility();
              },
              focusNode: FocusNode(skipTraversal: true), // skip focus
              color: NeutralColor.ne04,
              iconSize: 20.0,
              icon: Icon(
                _isPasswordObscured ? Icons.visibility : Icons.visibility_off,
              ),
            ),
            onChanged: (value) {
              passwordController.text = value;
            },
            controller: passwordController,
          ),
          const SizedBox(height: 16.0),
          const ForgotPasswordButton(),
          const SizedBox(height: 24.0),
          LoginEmailPasswordButton(
            email: emailController,
            password: passwordController,
          ),
          const SizedBox(height: 16.0),
          const RegisterButton(),
        ],
      ),
    );
  }
}
