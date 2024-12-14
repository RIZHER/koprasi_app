import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../../../constant/constant.dart';
import '../../../../../utils/global_components/main_button.dart';
import '../../../../../utils/global_components/text_input_field.dart';
import '../controllers/tarik_tunai_admin_controller.dart';

class TarikTunaiAdminView extends GetView<TarikTunaiAdminController> {
  const TarikTunaiAdminView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tarik Tunai',
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
              "Masukkan No KTP dan Kode Transaksi Nasabah",
              style: regular.copyWith(
                fontSize: 16,
                color: Black.black_500,
              ),
            ),
            Gap(35),
            Text(
              "No KTP",
              style: regular.copyWith(
                fontSize: 14,
                color: Black.black_500,
              ),
            ),
            Gap(5),
            InputField(title: 'Masukkan no KTP'),
            Gap(15),
            Text(
              "Kode Transaksi",
              style: regular.copyWith(
                fontSize: 14,
                color: Black.black_500,
              ),
            ),
            Gap(5),
            InputField(title: 'Masukkan kode transaksi'),
            Gap(40),
            MainButton(
              onTap: () {
                controller.doSetor();
              },
              label: 'Lanjut',
            ),
          ],
        ),
      ),
    );
  }
}
