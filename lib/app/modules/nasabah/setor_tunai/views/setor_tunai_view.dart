import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:koperasi_app/utils/global_components/main_button.dart';

import '../../../../../constant/constant.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/setor_tunai_controller.dart';

class SetorTunaiView extends GetView<SetorTunaiController> {
  final SetorTunaiController setorTunaiController =
      Get.put(SetorTunaiController());
  final List<String> nominalList = [
    "50000",
    "100000",
    "150000",
    "200000",
    "300000",
    "500000",
  ];
  final formatuang =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 2);

  SetorTunaiView({super.key});

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
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Lakukan Setor Tunai pada Admin KoNT di Daerah Anda",
                style: regular.copyWith(
                  fontSize: 16,
                  color: Neutral.neutral_400,
                ),
              ),
              Gap(15),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Primary.second2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "SALDO :",
                      style: regular.copyWith(
                        fontSize: 16,
                        color: White.white_50,
                      ),
                    ),
                    Text(
                      formatuang.format(controller.loggedInUser.value!.saldo),
                      style: semiBold.copyWith(
                        fontSize: 20,
                        color: White.white_50,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(30),
              Container(
                height: 130,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Jumlah item per baris
                    crossAxisSpacing: 10, // Jarak antar item secara horizontal
                    mainAxisSpacing: 10, // Jarak antar item secara vertikal
                    childAspectRatio: 2, // Rasio lebar dan tinggi
                  ),
                  itemCount: nominalList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        controller.setInputValue(nominalList[index]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Neutral.neutral_100, // Warna background tombol
                          borderRadius: BorderRadius.circular(
                              20), // Membuat sudut melengkung
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          // ignore: prefer_interpolation_to_compose_strings
                          'Rp ' + nominalList[index],
                          style: TextStyle(
                            color: White.white_50, // Warna teks
                            fontSize: 16, // Ukuran teks
                            fontWeight: FontWeight.bold, // Ketebalan teks
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Gap(30),
              Text(
                "Masukkan nominal",
                style: regular.copyWith(
                  fontSize: 14,
                  color: Neutral.neutral_400,
                ),
              ),
              Gap(10),
              // Gunakan TextEditingController dari controller
              TextField(
                controller: controller.textController,
                keyboardType: TextInputType.number,
                decoration: primary.copyWith(
                  hintText: 'Rp xxx xxx xxx',
                  hintStyle: regular.copyWith(
                    fontSize: 14,
                    color: Neutral.neutral_300,
                  ),
                ),
              ),
              Gap(40),
              MainButton(
                onTap: () {
                  // Tindakan lanjut
                  print(
                      "Nominal yang dipilih: ${controller.textController.text}");
                  controller.cekPass();
                },
                label: 'Lanjut',
              )
            ],
          ),
        ),
      ),
    );
  }
}
