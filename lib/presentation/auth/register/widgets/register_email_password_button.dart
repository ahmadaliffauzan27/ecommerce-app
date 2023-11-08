import 'package:ecommerce_app/common/components/button.dart';
import 'package:ecommerce_app/data/models/requests/register_request_model.dart';
import 'package:ecommerce_app/presentation/auth/bloc/register/register_bloc.dart';
import 'package:ecommerce_app/presentation/auth/login/screen/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.nameController,
    required this.passwordController,
    required this.emailController,
    required this.confirmPasswordController,
  });

  final TextEditingController nameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        state.maybeWhen(
            orElse: () {},
            success: (data) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Berhasil Mendaftar'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: Colors.red,
                ),
              );
            });
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return Button.filled(
              onPressed: () {
                if (nameController.text.isEmpty ||
                    emailController.text.isEmpty ||
                    passwordController.text.isEmpty ||
                    confirmPasswordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Form harus diisi!'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
                // else if (passwordController.text !=
                //     confirmPasswordController.text) {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(
                //       content: Text('Kata Sandi Tidak Sesuai!'),
                //       backgroundColor: Colors.red,
                //     ),
                //   );
                // }
                // Kata sandi sesuai, kirim permintaan pendaftaran
                final dataRegister = RegisterRequestModel(
                  name: nameController.text,
                  password: passwordController.text,
                  email: emailController.text,
                  username: nameController.text.replaceAll(' ', ''),
                );
                context
                    .read<RegisterBloc>()
                    .add(RegisterEvent.register(dataRegister));
              },
              label: 'Daftar',
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}
