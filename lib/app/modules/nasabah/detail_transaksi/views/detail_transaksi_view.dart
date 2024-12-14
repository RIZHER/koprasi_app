import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../../../constant/constant.dart';
import '../../../../../utils/global_components/main_button.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/detail_transaksi_controller.dart';

class DetailTransaksiView extends GetView<DetailTransaksiController> {
  const DetailTransaksiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Transaksi',
          style: semiBold.copyWith(
            fontSize: 24,
            color: Primary.main,
          ),
        ),
        backgroundColor: White.white_50,
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            width: 20,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "10 Desember 2024 | 15:40:11",
              style: regular.copyWith(
                fontSize: 16,
                color: Neutral.neutral_400,
              ),
            ),
            Gap(20),
            Container(
              width: double.infinity,
              height: 300,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Primary.second2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "No KTP",
                    style: regular.copyWith(
                      fontSize: 16,
                      color: White.white_50,
                    ),
                  ),
                  Text(
                    "517101231504031001",
                    style: semiBold.copyWith(
                      fontSize: 20,
                      color: White.white_50,
                    ),
                  ),
                  Divider(
                    color: White.white_50,
                  ),
                  Gap(5),
                  Text(
                    "Kode Transaksi",
                    style: regular.copyWith(
                      fontSize: 16,
                      color: White.white_50,
                    ),
                  ),
                  Text(
                    "512698",
                    style: semiBold.copyWith(
                      fontSize: 20,
                      color: White.white_50,
                    ),
                  ),
                  Divider(
                    color: White.white_50,
                  ),
                  Gap(5),
                  Text(
                    "Nominal",
                    style: regular.copyWith(
                      fontSize: 16,
                      color: White.white_50,
                    ),
                  ),
                  Text(
                    "RP 2.500.000,00",
                    style: semiBold.copyWith(
                      fontSize: 20,
                      color: White.white_50,
                    ),
                  ),
                  Divider(
                    color: White.white_50,
                  ),
                  Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Batas Waktu",
                        style: regular.copyWith(
                          fontSize: 16,
                          color: White.white_50,
                        ),
                      ),
                      Text(
                        "10 Des 2024 16:40",
                        style: bold.copyWith(
                          fontSize: 16,
                          color: White.white_50,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Gap(60),
            MainButton(
              onTap: () {
                Get.offNamed(Routes.HOME);
              },
              label: 'Kembali ke Home',
            )
          ],
        ),
      ),
    );
  }
}
