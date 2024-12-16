import 'package:get/get.dart';
import 'package:koperasi_app/constant/constant.dart';

import '../../../../routes/app_pages.dart';
import '../service/daftarkan_nasabah_service.dart';

class DaftarkanNasabahController extends GetxController {
  RxString nama_lengkap = ''.obs;
  RxString username = ''.obs;
  RxString no_ktp = ''.obs;
  RxString nama_ibu = ''.obs;
  RxString alamat = ''.obs;

  void namaLengkap(String value) {
    nama_lengkap.value = value;
  }

  void userName(String value) {
    username.value = value;
  }

  void noKtp(String value) {
    no_ktp.value = value;
  }

  void namaIbu(String value) {
    nama_ibu.value = value;
  }

  void Alamat(String value) {
    alamat.value = value;
  }

  // Method to register a new user
  Future<void> doRegister() async {
    try {
      final response = await AddNewUserService().addNewUser(
        username: username.value,
        nama_lengkap: nama_lengkap.value,
        nama_ibu: nama_ibu.value,
        no_ktp: int.parse(no_ktp.value),
        alamat: alamat.value,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Jika berhasil
        Get.toNamed(
            Routes.DETAIL_REGISTRASI_NASABAH); // Pindah ke halaman detail
        Get.snackbar(
          "Success",
          "Pendaftaran nasabah berhasil",
          backgroundColor: Success.mainColor,
        );
      } else {
        // Jika response tidak sesuai harapan
        Get.snackbar(
          "Error",
          "Gagal mendaftarkan nasabah. Silakan coba lagi.",
          backgroundColor: Error.mainColor,
        );
      }
    } catch (e) {
      // Tangani error
      Get.snackbar(
        "Error",
        "Terjadi kesalahan: $e",
        backgroundColor: Error.mainColor,
      );
    }
  }
}
