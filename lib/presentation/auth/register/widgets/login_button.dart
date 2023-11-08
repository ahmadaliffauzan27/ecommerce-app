import 'package:ecommerce_app/common/components/font_weight.dart';
import 'package:ecommerce_app/common/constants/app_text_style.dart';
import 'package:ecommerce_app/common/constants/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Sudah Punya Akun? ',
            style: AppTextStyle.body4.medium,
          ),
          TextSpan(
            text: 'Login',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                FocusScope.of(context).unfocus();

                // context.router.push(const RegisterRoute());
              },
            style: AppTextStyle.body4.medium.copyWith(
              color: PrimaryColor.pr10,
            ),
          ),
        ],
        style: AppTextStyle.body3,
      ),
      textAlign: TextAlign.center,
    );
  }
}
