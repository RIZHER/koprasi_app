import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:koperasi_app/app/routes/app_pages.dart';
import 'package:koperasi_app/utils/global_components/main_button.dart';
import 'package:koperasi_app/utils/global_components/text_input_field.dart';

import '../../../../../constant/constant.dart';
import '../controllers/daftarkan_nasabah_controller.dart';

class DaftarkanNasabahView extends GetView<DaftarkanNasabahController> {
  const DaftarkanNasabahView({super.key});
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
              "Isi Data Berikut Untuk Mendaftarkan Nasabah KoNT.",
              style: semiBold.copyWith(
                fontSize: 16,
                color: Black.black_500,
              ),
            ),
            Gap(30),
            Text(
              "Nama Lengkap",
              style: regular.copyWith(
                fontSize: 14,
                color: Black.black_500,
              ),
            ),
            Gap(5),
            InputField(title: 'Masukkan nama'),
            Gap(20),
            Text(
              "Username",
              style: regular.copyWith(
                fontSize: 14,
                color: Black.black_500,
              ),
            ),
            Gap(5),
            InputField(title: 'Masukkan username'),
            Gap(20),
            Text(
              "No KTP",
              style: regular.copyWith(
                fontSize: 14,
                color: Black.black_500,
              ),
            ),
            Gap(5),
            InputField(title: 'Masukkan no KTP'),
            Gap(20),
            Text(
              "Nama Gadis Ibu Kandung",
              style: regular.copyWith(
                fontSize: 14,
                color: Black.black_500,
              ),
            ),
            Gap(5),
            InputField(title: 'Masukkan nama ibu'),
            Gap(20),
            Text(
              "Alamat Lengkap",
              style: regular.copyWith(
                fontSize: 14,
                color: Black.black_500,
              ),
            ),
            Gap(5),
            InputField(title: 'Masukkan alamat'),
            Gap(60),
            MainButton(
              onTap: () {
                Get.toNamed(Routes.DETAIL_REGISTRASI_NASABAH);
              },
              label: 'Daftarkan',
            ),
          ],
        ),
      ),
    );
  }
}
