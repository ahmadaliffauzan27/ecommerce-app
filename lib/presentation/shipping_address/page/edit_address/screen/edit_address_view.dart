import 'package:ecommerce_app/common/components/button.dart';
import 'package:ecommerce_app/common/components/custom_dropdown.dart';
import 'package:ecommerce_app/common/components/custom_textfield2.dart';
import 'package:ecommerce_app/common/components/font_weight.dart';
import 'package:ecommerce_app/common/components/space_height.dart';
import 'package:ecommerce_app/common/constants/app_text_style.dart';
import 'package:ecommerce_app/presentation/shipping_address/models/address_model.dart';
import 'package:flutter/material.dart';

class EditAddressPage extends StatefulWidget {
  final AddressModel data;
  const EditAddressPage({super.key, required this.data});

  @override
  State<EditAddressPage> createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage> {
  late ValueNotifier<String> selectedCountry;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController addressController;
  late TextEditingController secondAddressController;
  late TextEditingController cityController;
  late TextEditingController provinceController;
  late TextEditingController zipCodeController;
  late TextEditingController phoneNumberController;

  @override
  void initState() {
    selectedCountry = ValueNotifier<String>('Indonesia');
    firstNameController = TextEditingController(text: widget.data.name);
    lastNameController = TextEditingController(text: '');
    addressController = TextEditingController(text: widget.data.address);
    secondAddressController =
        TextEditingController(text: 'Jalan suka-suka, no 12');
    cityController = TextEditingController(text: 'Jember');
    provinceController = TextEditingController(text: 'Jawa Timur');
    zipCodeController = TextEditingController(text: '57793');
    phoneNumberController =
        TextEditingController(text: widget.data.phoneNumber);
    super.initState();
  }

  @override
  void dispose() {
    selectedCountry.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    secondAddressController.dispose();
    cityController.dispose();
    provinceController.dispose();
    zipCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Alamat',
          style: AppTextStyle.body2.semiBold,
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 16,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ValueListenableBuilder(
            valueListenable: selectedCountry,
            builder: (context, value, _) => CustomDropdown(
              value: value,
              items: const ['Indonesia', 'Inggris'],
              label: 'Negara atau wilayah',
              onChanged: (value) => selectedCountry.value = value!,
            ),
          ),
          const SpaceHeight(24.0),
          CustomTextField2(
            controller: firstNameController,
            label: 'Nama Depan',
          ),
          const SpaceHeight(24.0),
          CustomTextField2(
            controller: lastNameController,
            label: 'Nama Belakang',
          ),
          const SpaceHeight(24.0),
          CustomTextField2(
            controller: addressController,
            label: 'Alamat Jalan',
          ),
          const SpaceHeight(24.0),
          CustomTextField2(
            controller: secondAddressController,
            label: 'Alamat jalans 2 (Opsional)',
          ),
          const SpaceHeight(24.0),
          CustomTextField2(
            controller: cityController,
            label: 'Kota',
          ),
          const SpaceHeight(24.0),
          CustomTextField2(
            controller: provinceController,
            label: 'Provinsi',
          ),
          const SpaceHeight(24.0),
          CustomTextField2(
            controller: zipCodeController,
            label: 'Kode Pos',
            keyboardType: TextInputType.number,
          ),
          const SpaceHeight(24.0),
          CustomTextField2(
            controller: phoneNumberController,
            label: 'No Handphone',
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Button.filled(
          onPressed: () {
            Navigator.pop(context);
          },
          label: 'Update Alamat',
        ),
      ),
    );
  }
}
