import 'package:get/get.dart';

class DetailTransaksiController extends GetxController {
  RxString no_ktp = ''.obs;
  RxString kode_ransaksi = ''.obs;
  RxInt nominal = 0.obs;

  void setDetailTransaksi(
      {required RxString noktp,
      required RxString kodeTransaksi,
      required RxInt nominalUang}) {
    no_ktp = noktp;
    kode_ransaksi = kodeTransaksi;
    nominal = nominalUang;
  }
}
