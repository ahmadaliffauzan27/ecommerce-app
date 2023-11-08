import 'package:ecommerce_app/common/constants/app_text_style.dart';
import 'package:ecommerce_app/common/constants/colors.dart';
import 'package:flutter/material.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({Key? key}) : super(key: key);

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  bool isChecked = false;

  // Metode untuk membaca status checkbox
  bool get isCheckedValue => isChecked;

  // Metode untuk mengubah status checkbox
  void setCheckedValue(bool? newValue) {
    if (newValue != null) {
      setState(() {
        isChecked = newValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: CheckboxListTile(
        title: Text(
          'Saya menyetujui Syarat dan Ketentuan serta Kebijakan Privasi Kampus Gratis',
          style: AppTextStyle.body4.copyWith(color: NeutralColor.ne09),
        ),
        value: isChecked,
        activeColor: InfoColor.inf05,
        onChanged: (bool? newValue) {
          setCheckedValue(
              newValue); // Memanggil metode untuk mengubah status checkbox
        },
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: const EdgeInsets.all(0),
      ),
    );
  }
}
