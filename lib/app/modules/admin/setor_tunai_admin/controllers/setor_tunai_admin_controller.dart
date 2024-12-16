import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:koperasi_app/constant/constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../routes/app_pages.dart';

class SetorTunaiAdminController extends GetxController {
  // Future<void> doSetor() async {

  // }
  var resultMessage = ''.obs;

  Future<void> validateTransaction({
    required int noKtp,
    required int kodeTransaksi,
    required String namaKantor,
  }) async {
    try {
      // Panggil fungsi RPC validate_transaction
      final response =
          await Supabase.instance.client.rpc('validate_transaction', params: {
        'p_no_ktp': noKtp,
        'p_kode_transaksi': kodeTransaksi,
        'p_nama_kantor': namaKantor,
      });

      Get.dialog(
        barrierDismissible: false,
        Dialog(
          backgroundColor: White.white_50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            onTap: () {
              Get.offNamed(Routes.HOME_ADMIN);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 1,
                horizontal: 1,
              ),
              child: Container(
                width: 340,
                height: 300,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/ilustrasi.svg'),
                      Gap(30),
                      Text(
                        "Sukses Melakukan Setoran 🤗",
                        style: semiBold.copyWith(
                          fontSize: 14,
                          color: Success.mainColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      // Update hasil response
      resultMessage.value = response.toString();
      print(resultMessage.value);
    } catch (e) {
      resultMessage.value = 'Error: $e';
      Get.snackbar(
        'Transaksi Gagal', // Judul Snackbar
        'No KTP dan Kode Transaksi tidak sesuai', // Pesan Snackbar
        snackPosition: SnackPosition.TOP, // Posisi Snackbar
        backgroundColor: Error.mainColor, // Warna background
        colorText: White.white_50, // Warna teks
        icon: const Icon(
          Icons.error,
          color: White.white_50,
        ), // Ikon tambahan
        duration: const Duration(seconds: 3), // Durasi tampil
      );
      print(resultMessage.value);
    }
  }
}
