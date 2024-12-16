import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:koperasi_app/utils/global_components/main_button.dart';
import 'package:koperasi_app/utils/global_components/text_input_field.dart';

import '../../../../../constant/constant.dart';
import '../controllers/setor_tunai_admin_controller.dart';

class SetorTunaiAdminView extends GetView<SetorTunaiAdminController> {
  final SetorTunaiAdminController setorTunaiAdminController =
      Get.put(SetorTunaiAdminController());

  // Controller untuk input
  final TextEditingController noKtpController = TextEditingController();
  final TextEditingController kodeTransaksiController = TextEditingController();
  final TextEditingController namaKantorController = TextEditingController();
  SetorTunaiAdminView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setor Tunai',
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
            InputField(
              controller: noKtpController,
              title: 'Masukkan no KTP',
            ),
            Gap(15),
            Text(
              "Kode Transaksi",
              style: regular.copyWith(
                fontSize: 14,
                color: Black.black_500,
              ),
            ),
            Gap(5),
            InputField(
              controller: kodeTransaksiController,
              title: 'Masukkan kode transaksi',
            ),
            Gap(40),
            MainButton(
              onTap: () {
                controller.validateTransaction(
                  noKtp: int.parse(noKtpController.text),
                  kodeTransaksi: int.parse(kodeTransaksiController.text),
                  namaKantor: 'KoNT Kebo Iwa DPS',
                );
              },
              label: 'Lanjut',
            ),
          ],
        ),
      ),
    );
  }
}
