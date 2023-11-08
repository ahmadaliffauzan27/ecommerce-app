import 'package:ecommerce_app/common/components/font_weight.dart';
import 'package:ecommerce_app/common/components/space_height.dart';
import 'package:ecommerce_app/common/components/text_field.dart';
import 'package:ecommerce_app/common/constants/app_text_style.dart';
import 'package:ecommerce_app/common/constants/colors.dart';
import 'package:ecommerce_app/presentation/auth/login/screen/login_page.dart';
import 'package:ecommerce_app/presentation/auth/register/widgets/register_email_password_button.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordObscured = !_isPasswordObscured;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SpaceHeight(80.0),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text('Daftar',
                textAlign: TextAlign.center,
                style: AppTextStyle.heading5.semiBold),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Text(
              'Daftar Akun Kamu',
              textAlign: TextAlign.center,
              style: AppTextStyle.body2.copyWith(color: NeutralColor.ne05),
            ),
          ),
          const SpaceHeight(40.0),
          KgTextField(
            labelText: 'Nama Lengkap',
            hintText: 'Masukkan nama lengkap',
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            controller: nameController,
            onChanged: (value) {
              nameController.text = value;
            },
          ),
          const SizedBox(height: 16.0),
          KgTextField(
            labelText: 'Email',
            hintText: 'Masukkan email',
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
            hintText: 'Masukkan Kata Sandi',
            obscureText: _isPasswordObscured,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
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
            controller: passwordController,
            onChanged: (value) {
              passwordController.text = value;
            },
          ),
          const SizedBox(height: 16.0),
          KgTextField(
            labelText: 'Konfirmasi Kata Sandi',
            hintText: 'Konfirmasi Kata Sandi',
            obscureText: _isConfirmPasswordObscured,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
            suffixIcon: IconButton(
              onPressed: () {
                _toggleConfirmPasswordVisibility();
              },
              focusNode: FocusNode(skipTraversal: true), // skip focus
              color: NeutralColor.ne04,
              iconSize: 20.0,
              icon: Icon(
                _isConfirmPasswordObscured
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
            ),
            controller: confirmPasswordController,
            onChanged: (value) {
              confirmPasswordController.text = value;
            },
          ),
          const SpaceHeight(24.0),
          RegisterButton(
              nameController: nameController,
              passwordController: passwordController,
              confirmPasswordController: confirmPasswordController,
              emailController: emailController),
          const SpaceHeight(60.0),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LoginPage()));
              },
              child: Text.rich(
                TextSpan(
                  text: "Sudah punya akun? ",
                  children: const [
                    TextSpan(
                      text: "Sign In",
                      style: TextStyle(color: PrimaryColor.pr10),
                    ),
                  ],
                  style: AppTextStyle.body4.copyWith(
                    color: NeutralColor.ne05,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
