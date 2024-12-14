import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:koperasi_app/utils/global_components/main_button.dart';

import '../../../../../constant/constant.dart';
import '../../../../routes/app_pages.dart';

class DetailRegistrasiView extends GetView {
  const DetailRegistrasiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registrasi Nasabah',
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
              "*Registrasi Sukses",
              style: regular.copyWith(
                fontSize: 16,
                color: Success.mainColor,
              ),
            ),
            Gap(35),
            Text(
              "Berikut Merupakan Data Nasabah",
              style: regular.copyWith(
                fontSize: 16,
                color: Black.black_500,
              ),
            ),
            Gap(25),
            Text(
              "Username : ANANDAPUTRA69",
              style: regular.copyWith(
                fontSize: 16,
                color: Black.black_500,
              ),
            ),
            Text(
              "PIN : 123456",
              style: regular.copyWith(
                fontSize: 16,
                color: Black.black_500,
              ),
            ),
            Gap(25),
            Text(
              "Mohon Untuk Segera Login di Aplikasi KoNT Untuk Mengganti PIN!",
              style: regular.copyWith(
                fontSize: 16,
                color: Black.black_500,
              ),
            ),
            Gap(40),
            MainButton(
              onTap: () {
                Get.toNamed(Routes.HOME_ADMIN);
              },
              label: 'Kembali ke Home',
            )
          ],
        ),
      ),
    );
  }
}
