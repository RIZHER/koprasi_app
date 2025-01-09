import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:koperasi_app/app/routes/app_pages.dart';

import '../../../../../constant/constant.dart';
import '../../../../../utils/global_components/history_transaksi.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController homeController = Get.put(HomeController());

  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          // Ambil data dari loggedInUser untuk ditampilkan
          var user = controller.loggedInUser.value!;

          // Format saldo menjadi mata uang Indonesia (Rupiah)
          String formattedSaldo =
              NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')
                  .format(user.saldo);
          return RefreshIndicator(
            onRefresh: () async {
              // Fungsi untuk me-refresh data
              await controller.doFetchUser();
            },
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 248,
                    decoration: BoxDecoration(
                      color: Primary.main,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/images/gambar.png'),
                        scale: 1,
                        alignment: Alignment.centerRight,
                      ),
                      boxShadow: [shadowNavbar],
                    ),
                    child: Container(
                      height: 248,
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Selamat Datang Kembali",
                            style: regular.copyWith(
                              fontSize: 20,
                              color: White.white_50,
                            ),
                          ),
                          Text(
                            user.namaLengkap,
                            style: bold.copyWith(
                              fontSize: 20,
                              color: White.white_50,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  right: 22,
                  child: InkWell(
                    onTap: () {
                      Get.offAllNamed(Routes.SPLASHSCREEN);
                    },
                    child: Container(
                      height: 35,
                      width: 80,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Black.black_500,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: SvgPicture.asset('assets/icons/logout.svg'),
                          ),
                          Text(
                            "Keluar",
                            style: regular.copyWith(
                              fontSize: 12,
                              color: White.white_50,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 180,
                  left: 20,
                  right: 20,
                  child: Container(
                    height: 100,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Primary.second2,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
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
                        const SizedBox(height: 5),
                        Text(
                          formattedSaldo,
                          style: bold.copyWith(
                            fontSize: 20,
                            color: White.white_50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 320,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height -
                        320, // Tinggi layar dikurangi tinggi header
                    width: MediaQuery.of(context).size.width,

                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.SETOR_TUNAI);
                                  },
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    width: 149,
                                    height: 80,
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: Primary.second2,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [blur4, blur8],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/setor_tunai.svg'),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Setor",
                                              style: semiBold.copyWith(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              "Tunai",
                                              style: semiBold.copyWith(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.TARIK_TUNAI);
                                  },
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    width: 149,
                                    height: 80,
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: Primary.second2,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [blur4, blur8],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/tarik_tunai.svg'),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Tarik",
                                              style: semiBold.copyWith(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              "Tunai",
                                              style: semiBold.copyWith(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gap(30),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Riwayat Transaksi",
                                style: regular.copyWith(
                                  fontSize: 20,
                                  color: Primary.main,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.toNamed(Routes.HISTORYUSER);
                                },
                                child: Text(
                                  "All",
                                  style: regular.copyWith(
                                    fontSize: 16,
                                    color: Primary.second2,
                                  ),
                                ),
                              )
                            ],
                          ),
                          controller.historyUser.isEmpty
                              ? Expanded(
                                  child: Center(
                                    child: Text(
                                      "Belum ada transaksi",
                                      style: regular.copyWith(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                )
                              : Expanded(
                                  child: ListView.builder(
                                    padding: EdgeInsets.all(0),
                                    itemCount: controller.historyUser.length > 4
                                        ? 4
                                        : controller.historyUser.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      final transaksi =
                                          controller.historyUser[index];
                                      String formattedSaldo =
                                          NumberFormat.currency(
                                                  locale: 'id_ID',
                                                  symbol: 'Rp ')
                                              .format(
                                                  transaksi.jumlahTransaksi);
                                      return historyTransaksi(
                                        jenisTransaksi:
                                            transaksi.jenisTransaksi,
                                        kantor: transaksi
                                            .kantor, // Ubah sesuai data
                                        waktu:
                                            '10 Desember 2024 14:31 WITA', // Format waktu
                                        jumlahTransaksi:
                                            transaksi.jenisTransaksi ==
                                                    'Setor Tunai'
                                                ? '+ ${formattedSaldo}'
                                                : '- ${formattedSaldo}',
                                        statusuang: transaksi.jenisTransaksi ==
                                                'Setor Tunai'
                                            ? 'Uang Masuk'
                                            : 'Uang Keluar',
                                      );
                                    },
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
