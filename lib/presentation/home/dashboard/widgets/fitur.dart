import 'package:ecommerce_app/common/components/font_weight.dart';
import 'package:ecommerce_app/common/constants/app_text_style.dart';
import 'package:ecommerce_app/common/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            // context.router.push(const AdministrationRoute());
          },
          child: Column(
            children: [
              SizedBox(
                width: 38,
                child: Assets.icons.phone.image(),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Tablet &\nHandphone',
                style: AppTextStyle.body4,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            // pelatihanku
          },
          child: Column(
            children: [
              SizedBox(
                width: 38,
                child: Assets.icons.fashion.image(),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'fashion\nPria',
                style: AppTextStyle.body4,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            // context.router.push(
            //   const RencanaPelatihanRoute(),
            // );
            // context.router.push(
            //   const SurveyRoute(),
            // );
          },
          child: Column(
            children: [
              SizedBox(
                width: 38,
                child: Assets.icons.elektronik.image(),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Elektronik\n',
                style: AppTextStyle.body4,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return FractionallySizedBox(
                    heightFactor: 0.6,
                    child: Container(
                      // height: 600,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            children: [
                              Text(
                                'Semua Kategori',
                                style: AppTextStyle.body2.semiBold,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Expanded(
                                child: ListView(
                                  children: [
                                    Column(
                                      children: [
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {},
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    width: 38,
                                                    child: Assets.icons.phone
                                                        .image(),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    'Tablet &\nHandphone',
                                                    style: AppTextStyle.body4,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                SizedBox(
                                                  width: 38,
                                                  child: Assets.icons.fashion
                                                      .image(),
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                  'Fashion\nPria',
                                                  style: AppTextStyle.body4,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {},
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    width: 38,
                                                    child: Assets
                                                        .icons.elektronik
                                                        .image(),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    'Elektronik\n',
                                                    style: AppTextStyle.body4,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {},
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    width: 38,
                                                    child: Assets.icons.phone
                                                        .image(),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    'Ibu &\nBayi',
                                                    style: AppTextStyle.body4,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          },
          child: Column(
            children: [
              SizedBox(
                width: 38,
                child: Assets.icons.more.image(),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Lainnya\n',
                style: AppTextStyle.body4,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
