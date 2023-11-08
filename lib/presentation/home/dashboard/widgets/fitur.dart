import 'package:ecommerce_app/common/constants/app_text_style.dart';
import 'package:ecommerce_app/common/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class FiturLxp extends StatelessWidget {
  const FiturLxp({
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
              const SizedBox(
                width: 56,
                // child: Assets.icons.bag.image(),
                child: Icon(
                  Icons.sports_basketball,
                  size: 40,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Olahraga\n',
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
              const SizedBox(
                width: 56,
                // child: Assets.icons.bag.image(),
                child: Icon(
                  Icons.sports_basketball,
                  size: 40,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Olahraga\n',
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
              const SizedBox(
                width: 56,
                // child: Assets.icons.bag.image(),
                child: Icon(
                  Icons.sports_basketball,
                  size: 40,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Olahraga\n',
                style: AppTextStyle.body4,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            // showModalBottomSheet(
            //     context: context,
            //     isScrollControlled: true,
            //     builder: (BuildContext context) {
            //       return FractionallySizedBox(
            //         heightFactor: 0.6,
            //         child: Container(
            //           // height: 600,
            //           decoration: const BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.only(
            //               topLeft: Radius.circular(20),
            //               topRight: Radius.circular(20),
            //             ),
            //           ),
            //           child: Center(
            //             child: Padding(
            //               padding: const EdgeInsets.all(24),
            //               child: Column(
            //                 children: [
            //                   Text(
            //                     'Semua Fitur',
            //                     style: AppTextStyle.body2.setSemiBold(),
            //                   ),
            //                   const SizedBox(
            //                     height: 16,
            //                   ),
            //                   Expanded(
            //                     child: ListView(
            //                       children: [
            //                         Column(
            //                           children: [
            //                             const SizedBox(
            //                               height: 16,
            //                             ),
            //                             Row(
            //                               mainAxisAlignment:
            //                                   MainAxisAlignment.spaceBetween,
            //                               children: [
            //                                 GestureDetector(
            //                                   onTap: () {
            //                                     context.router.push(
            //                                         const AdministrationRoute());
            //                                   },
            //                                   child: Column(
            //                                     children: [
            //                                       SizedBox(
            //                                         width: 56,
            //                                         child: Assets
            //                                             .icons.administrasi
            //                                             .image(),
            //                                       ),
            //                                       const SizedBox(
            //                                         height: 8,
            //                                       ),
            //                                       const Text(
            //                                         'Administrasi\n',
            //                                         style: AppTextStyle.body4,
            //                                         textAlign: TextAlign.center,
            //                                       ),
            //                                     ],
            //                                   ),
            //                                 ),
            //                                 Column(
            //                                   children: [
            //                                     SizedBox(
            //                                       width: 56,
            //                                       child: Assets
            //                                           .icons.pelatihanku
            //                                           .image(),
            //                                     ),
            //                                     const SizedBox(
            //                                       height: 8,
            //                                     ),
            //                                     const Text(
            //                                       'Pelatihanku\n',
            //                                       style: AppTextStyle.body4,
            //                                       textAlign: TextAlign.center,
            //                                     ),
            //                                   ],
            //                                 ),
            //                                 GestureDetector(
            //                                   onTap: () {
            //                                     context.router.push(
            //                                       const RencanaPelatihanRoute(),
            //                                     );
            //                                   },
            //                                   child: Column(
            //                                     children: [
            //                                       SizedBox(
            //                                         width: 56,
            //                                         child: Assets
            //                                             .icons.rencanaPelatihan
            //                                             .image(),
            //                                       ),
            //                                       const SizedBox(
            //                                         height: 8,
            //                                       ),
            //                                       const Text(
            //                                         'Rencana\nPelatihan',
            //                                         style: AppTextStyle.body4,
            //                                         textAlign: TextAlign.center,
            //                                       ),
            //                                     ],
            //                                   ),
            //                                 ),
            //                                 GestureDetector(
            //                                   onTap: () {
            //                                     context.router.push(
            //                                         const NilaiSertifikatRoute());
            //                                   },
            //                                   child: Column(
            //                                     children: [
            //                                       SizedBox(
            //                                         width: 56,
            //                                         child: Assets
            //                                             .icons.nilaiSertifikat
            //                                             .image(),
            //                                       ),
            //                                       const SizedBox(
            //                                         height: 8,
            //                                       ),
            //                                       const Text(
            //                                         'Nilai\n& Sertifikat',
            //                                         style: AppTextStyle.body4,
            //                                         textAlign: TextAlign.center,
            //                                       ),
            //                                     ],
            //                                   ),
            //                                 ),
            //                               ],
            //                             ),
            //                             const SizedBox(
            //                               height: 16,
            //                             ),
            //                             Row(
            //                               mainAxisAlignment:
            //                                   MainAxisAlignment.spaceBetween,
            //                               children: [
            //                                 GestureDetector(
            //                                   onTap: () {
            //                                     context.router.push(
            //                                         const PenugasanRoute());
            //                                   },
            //                                   child: Column(
            //                                     children: [
            //                                       SizedBox(
            //                                         width: 56,
            //                                         child: Assets
            //                                             .icons.penugasanPng
            //                                             .image(),
            //                                       ),
            //                                       const SizedBox(
            //                                         height: 8,
            //                                       ),
            //                                       const Text(
            //                                         'Penugasan\n',
            //                                         style: AppTextStyle.body4,
            //                                         textAlign: TextAlign.center,
            //                                       ),
            //                                     ],
            //                                   ),
            //                                 ),
            //                                 Column(
            //                                   children: [
            //                                     SizedBox(
            //                                       width: 56,
            //                                       child: Assets
            //                                           .icons.forumDiskusi
            //                                           .image(),
            //                                     ),
            //                                     const SizedBox(
            //                                       height: 8,
            //                                     ),
            //                                     const Text(
            //                                       'Forum\nDiskusi',
            //                                       style: AppTextStyle.body4,
            //                                       textAlign: TextAlign.center,
            //                                     ),
            //                                   ],
            //                                 ),
            //                                 Column(
            //                                   children: [
            //                                     SizedBox(
            //                                       width: 56,
            //                                       child: Assets
            //                                           .icons.layananKonsultasi
            //                                           .image(),
            //                                     ),
            //                                     const SizedBox(
            //                                       height: 8,
            //                                     ),
            //                                     const Text(
            //                                       'Layanan\nKonsultasi',
            //                                       style: AppTextStyle.body4,
            //                                       textAlign: TextAlign.center,
            //                                     ),
            //                                   ],
            //                                 ),
            //                                 Column(
            //                                   children: [
            //                                     SizedBox(
            //                                       width: 56,
            //                                       child: Assets
            //                                           .icons.simulasiDrill
            //                                           .image(),
            //                                     ),
            //                                     const SizedBox(
            //                                       height: 8,
            //                                     ),
            //                                     const Text(
            //                                       'Simulasi\n& Drill',
            //                                       style: AppTextStyle.body4,
            //                                       textAlign: TextAlign.center,
            //                                     ),
            //                                   ],
            //                                 ),
            //                               ],
            //                             ),
            //                             const SizedBox(
            //                               height: 16,
            //                             ),
            //                             Row(
            //                               mainAxisAlignment:
            //                                   MainAxisAlignment.spaceBetween,
            //                               children: [
            //                                 Column(
            //                                   children: [
            //                                     SizedBox(
            //                                       width: 56,
            //                                       child: Assets.icons.kalender
            //                                           .image(),
            //                                     ),
            //                                     const SizedBox(
            //                                       height: 8,
            //                                     ),
            //                                     const Text(
            //                                       'Kalender\nSaya',
            //                                       style: AppTextStyle.body4,
            //                                       textAlign: TextAlign.center,
            //                                     ),
            //                                   ],
            //                                 ),
            //                                 Column(
            //                                   children: [
            //                                     SizedBox(
            //                                       width: 56,
            //                                       child: Assets.icons.papanSkor
            //                                           .image(),
            //                                     ),
            //                                     const SizedBox(
            //                                       height: 8,
            //                                     ),
            //                                     const Text(
            //                                       'Papan Skor',
            //                                       style: AppTextStyle.body4,
            //                                       textAlign: TextAlign.center,
            //                                     ),
            //                                   ],
            //                                 ),
            //                                 Column(
            //                                   children: [
            //                                     SizedBox(
            //                                       width: 56,
            //                                       child: Assets.icons.panduan
            //                                           .image(),
            //                                     ),
            //                                     const SizedBox(
            //                                       height: 8,
            //                                     ),
            //                                     const Text(
            //                                       'Panduan\n',
            //                                       style: AppTextStyle.body4,
            //                                       textAlign: TextAlign.center,
            //                                     ),
            //                                   ],
            //                                 ),
            //                                 Column(
            //                                   children: [
            //                                     SizedBox(
            //                                       width: 56,
            //                                       child: Assets
            //                                           .icons.sekilasIlmu
            //                                           .image(),
            //                                     ),
            //                                     const SizedBox(
            //                                       height: 8,
            //                                     ),
            //                                     const Text(
            //                                       'Sekilas\nIlmu',
            //                                       style: AppTextStyle.body4,
            //                                       textAlign: TextAlign.center,
            //                                     ),
            //                                   ],
            //                                 ),
            //                               ],
            //                             ),
            //                             const SizedBox(
            //                               height: 16,
            //                             ),
            //                             Row(
            //                               mainAxisAlignment:
            //                                   MainAxisAlignment.spaceBetween,
            //                               children: [
            //                                 GestureDetector(
            //                                   onTap: () {
            //                                     context.router.push(
            //                                         const AcaraUnikRoute());
            //                                   },
            //                                   child: Column(
            //                                     children: [
            //                                       SizedBox(
            //                                         width: 56,
            //                                         child: Assets
            //                                             .icons.acaraUnik
            //                                             .image(),
            //                                       ),
            //                                       const SizedBox(
            //                                         height: 8,
            //                                       ),
            //                                       const Text(
            //                                         'Acara\nUnik',
            //                                         style: AppTextStyle.body4,
            //                                         textAlign: TextAlign.center,
            //                                       ),
            //                                     ],
            //                                   ),
            //                                 ),
            //                                 Column(
            //                                   children: [
            //                                     SizedBox(
            //                                       width: 56,
            //                                       child: Assets.icons.analytic
            //                                           .image(),
            //                                     ),
            //                                     const SizedBox(
            //                                       height: 8,
            //                                     ),
            //                                     const Text(
            //                                       'Analytic\n',
            //                                       style: AppTextStyle.body4,
            //                                       textAlign: TextAlign.center,
            //                                     ),
            //                                   ],
            //                                 ),
            //                                 Column(
            //                                   children: [
            //                                     SizedBox(
            //                                       width: 56,
            //                                       child: Assets.icons.analytic
            //                                           .image(),
            //                                     ),
            //                                     const SizedBox(
            //                                       height: 8,
            //                                     ),
            //                                     const Text(
            //                                       'Coaching\nKarir',
            //                                       style: AppTextStyle.body4,
            //                                       textAlign: TextAlign.center,
            //                                     ),
            //                                   ],
            //                                 ),
            //                                 Column(
            //                                   children: [
            //                                     SizedBox(
            //                                       width: 56,
            //                                       child: Assets.icons.analytic
            //                                           .image(),
            //                                     ),
            //                                     const SizedBox(
            //                                       height: 8,
            //                                     ),
            //                                     const Text(
            //                                       'Post\nTraining',
            //                                       style: AppTextStyle.body4,
            //                                       textAlign: TextAlign.center,
            //                                     ),
            //                                   ],
            //                                 ),
            //                               ],
            //                             ),
            //                           ],
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //       );
            //     });
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
