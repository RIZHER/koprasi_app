// ignore_for_file: unnecessary_null_comparison, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../constant/constant.dart';
import '../../../../../utils/global_components/history_transaksi.dart';
import '../controllers/home_controller.dart';

class HistotyTransaksiView extends GetView<HomeController> {
  final HomeController homeController = Get.put(HomeController());

  HistotyTransaksiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Riwayat Transaksi',
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
      body: Obx(() {
        if (controller.historyUser.value == null ||
            controller.historyUser.value.isEmpty) {
          // Jika data kosong, tampilkan pesan
          return Center(
            child: Text(
              "Belum ada transaksi",
              style: regular.copyWith(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          );
        }

        // Jika ada data, tampilkan dalam ListView
        return Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: controller.historyUser.length > 4
                ? 4
                : controller.historyUser.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final transaksi = controller.historyUser[index];
              String formattedSaldo =
                  NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')
                      .format(transaksi.jumlahTransaksi);
              return historyTransaksi(
                jenisTransaksi: transaksi.jenisTransaksi,
                kantor: transaksi.kantor, // Ubah sesuai data
                waktu: '10 Desember 2024 14:31 WITA', // Format waktu
                jumlahTransaksi: transaksi.jenisTransaksi == 'Setor Tunai'
                    ? '+ ${formattedSaldo}'
                    : '- ${formattedSaldo}',
                statusuang: transaksi.jenisTransaksi == 'Setor Tunai'
                    ? 'Uang Masuk'
                    : 'Uang Keluar',
              );
            },
          ),
        );
      }),
    );
  }
}
