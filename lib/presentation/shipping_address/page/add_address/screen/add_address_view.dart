import 'package:ecommerce_app/common/components/button.dart';
import 'package:ecommerce_app/common/components/custom_dropdown.dart';
import 'package:ecommerce_app/common/components/custom_textfield2.dart';
import 'package:ecommerce_app/common/components/font_weight.dart';
import 'package:ecommerce_app/common/components/space_height.dart';
import 'package:ecommerce_app/common/constants/app_text_style.dart';
import 'package:ecommerce_app/data/datasource/auth_local_datasource.dart';
import 'package:ecommerce_app/data/models/responses/city_response_model.dart';
import 'package:ecommerce_app/data/models/responses/province_response_model.dart';
import 'package:ecommerce_app/data/models/responses/subdistrict_response_model.dart';
import 'package:ecommerce_app/presentation/shipping_address/page/shipping_address/bloc/add_address/add_address_bloc.dart';
import 'package:ecommerce_app/presentation/shipping_address/page/shipping_address/bloc/city/city_bloc.dart';
import 'package:ecommerce_app/presentation/shipping_address/page/shipping_address/bloc/province/province_bloc.dart';
import 'package:ecommerce_app/presentation/shipping_address/page/shipping_address/bloc/subdistric/subdistric_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  bool isDefault = false;

  Province selectedProvince = Province(
    provinceId: '1',
    province: 'Bali',
  );

  City selectedCity = City(
    cityId: '1',
    provinceId: '1',
    province: 'Bali',
    type: 'Kabupaten',
    cityName: 'Badung',
    postalCode: '80351',
  );

  SubDistrict selectedSubdistrict = SubDistrict(
    subdistrictId: '1',
    provinceId: '1',
    province: 'Bali',
    cityId: '1',
    city: 'Badung',
    type: 'Kabupaten',
    subdistrictName: 'Kuta',
  );

  @override
  void initState() {
    context.read<ProvinceBloc>().add(const ProvinceEvent.getAll());
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();

    zipCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tambah Alamat',
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
          const SpaceHeight(24.0),
          CustomTextField2(
            controller: nameController,
            label: 'Nama Lengkap',
            keyboardType: TextInputType.name,
          ),
          const SpaceHeight(24.0),
          CustomTextField2(
            controller: addressController,
            label: 'Alamat Jalan',
            maxLines: 3,
            keyboardType: TextInputType.multiline,
          ),
          const SpaceHeight(24.0),
          CustomTextField2(
            controller: phoneNumberController,
            label: 'No Handphone',
            keyboardType: TextInputType.phone,
          ),
          const SpaceHeight(24.0),
          BlocBuilder<ProvinceBloc, ProvinceState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loaded: (provinces) {
                  // selectedProvince = provinces.first;
                  return CustomDropdown<Province>(
                    value: provinces.first,
                    items: provinces,
                    label: 'Provinsi',
                    onChanged: (value) {
                      setState(() {
                        selectedProvince = value!;
                        context.read<CityBloc>().add(
                            CityEvent.getAllByProvinceId(
                                selectedProvince.provinceId));
                      });
                    },
                  );
                },
              );
            },
          ),
          const SpaceHeight(24.0),
          BlocBuilder<CityBloc, CityState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return CustomDropdown(
                    value: '-',
                    items: const ['-'],
                    label: 'Kota/Kab',
                    onChanged: (value) {},
                  );
                  // return const Center(
                  //   child: CircularProgressIndicator(),
                  // );
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loaded: (cities) {
                  // selectedCity = cities.first;
                  return CustomDropdown<City>(
                    value: cities.first,
                    items: cities,
                    label: 'Kota/Kab',
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value!;
                        context.read<SubdistricBloc>().add(
                            SubdistricEvent.getAllByCityId(
                                selectedCity.cityId));
                      });
                    },
                  );
                },
              );
            },
          ),
          const SpaceHeight(24.0),
          BlocBuilder<SubdistricBloc, SubdistricState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return CustomDropdown(
                    value: '-',
                    items: const ['-'],
                    label: 'Kecamatan',
                    onChanged: (value) {},
                  );
                  // return const Center(
                  //   child: CircularProgressIndicator(),
                  // );
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loaded: (subdistricts) {
                  // selectedSubdistrict = subdistricts.first;
                  return CustomDropdown<SubDistrict>(
                    value: subdistricts.first,
                    items: subdistricts,
                    label: 'Kecamatan',
                    onChanged: (value) {
                      setState(() {
                        selectedSubdistrict = value!;
                      });
                    },
                  );
                },
              );
            },
          ),
          const SpaceHeight(24.0),
          CustomTextField2(
            controller: zipCodeController,
            label: 'Kode Pos',
            keyboardType: TextInputType.number,
          ),
          const SpaceHeight(24.0),
          CheckboxListTile(
            value: isDefault,
            onChanged: (value) {
              setState(() {
                isDefault = value!;
              });
            },
            title: Text(
              'Jadikan alamat pengiriman utama',
              style: AppTextStyle.body4.medium.copyWith(color: Colors.black),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<AddAddressBloc, AddAddressState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              loaded: (response) {
                Navigator.pop(context, response);
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return Button.filled(
                  onPressed: () async {
                    // get user id
                    final userId = (await AuthLocalDataSource().getUser()).id;
                    // ignore: use_build_context_synchronously
                    context
                        .read<AddAddressBloc>()
                        .add(AddAddressEvent.addAddress(
                          name: nameController.text,
                          address: addressController.text,
                          phone: phoneNumberController.text,
                          provinceId: selectedProvince.provinceId,
                          cityId: selectedCity.cityId,
                          subdistrictId: selectedSubdistrict.subdistrictId,
                          provinceName: selectedProvince.province,
                          cityName: selectedCity.cityName,
                          subDistrictName: selectedSubdistrict.subdistrictName,
                          codePos: zipCodeController.text,
                          userId: userId.toString(),
                          isDefault: isDefault ? '1' : '',
                        ));
                    // ignore: use_build_context_synchronously
                    // Navigator.pop(context);
                  },
                  label: 'Tambah Alamat',
                );
              },
              loading: () {
                return const Center(child: CircularProgressIndicator());
              },
              error: (message) {
                return Button.filled(onPressed: () {}, label: 'Error');
              },
            );
          },
        ),
      ),
    );
  }
}
