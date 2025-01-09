import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koperasi_app/app/modules/login/mixins/verification_code_mixin.dart';
import 'package:koperasi_app/utils/global_components/main_button.dart';
import 'package:koperasi_app/utils/global_components/text_input_field.dart';

import '../../../../constant/constant.dart';
import '../../../routes/app_pages.dart';
import '../../../data/model/user_model.dart';
import '../service/login_service.dart'; // Pastikan Login model sudah ada

class LoginController extends GetxController with VerificationCodeMixin {
  RxString usernameLogin = ''.obs;
  RxString passwordLogin = ''.obs;
  RxBool obscureText = true.obs;
  RxString icon = ''.obs;
  RxString pin = ''.obs; // Menyimpan PIN yang dimasukkan

  final LoginService loginService = LoginService();
  final Rx<Login?> loggedInUser =
      Rx<Login?>(null); // Menyimpan data user yang login

  void setUsernameLogin(String value) {
    usernameLogin.value = value;
    print(usernameLogin.value);
  }

  void setPasswordLogin(String value) {
    passwordLogin.value = value;
    print(passwordLogin.value);
  }

  Future<void> doLogin() async {
    print(usernameLogin.value);
    print(passwordLogin.value);

    if (usernameLogin.value.isNotEmpty && passwordLogin.value.isNotEmpty) {
      try {
        Login? user = await loginService.loginUsers(
            usernameLogin.value, passwordLogin.value);

        if (user != null) {
          loggedInUser.value = user; // Menyimpan data user yang berhasil login
          // Jika role user
          if (user.role == 'user') {
            if (user.password == '123456') {
              Get.defaultDialog(
                title: 'Masukkan PIN Baru',
                titleStyle: bold.copyWith(
                  fontSize: 16,
                  color: Black.black_500,
                ),
                content: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InputPin(
                        title: 'Masukkan PIN 6 Digit',
                        onChanged: (value) {
                          pin.value = value; // Menyimpan PIN yang dimasukkan
                        },
                      ),
                      SizedBox(height: 20),
                      MainButton(
                        onTap: () {
                          if (pin.value.length == 6) {
                            // Jika PIN yang dimasukkan sudah lengkap (6 digit)
                            loginService.updatePassword(
                                user.id, pin.toString());
                            // Get.back(); // Menutup dialog
                            Get.back(); // Navigasi ke halaman Home
                            _showSnackbar(
                              title: 'Success',
                              message: 'Berhasil Mengganti Password',
                              color: Success.mainColor,
                            );
                          } else {
                            // Jika PIN kurang dari 6 digit
                            Get.snackbar(
                              'Error',
                              'PIN harus terdiri dari 6 digit',
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: Error.mainColor,
                              colorText: White.white_50,
                            );
                          }
                        },
                        label: 'Lanjut',
                      ),
                    ],
                  ),
                ),
              );
            } else {
              Get.offNamed(Routes.HOME); // Navigasi ke halaman Home
              _showSnackbar(
                title: 'Success',
                message: 'Berhasil Login',
                color: Color(Success.mainColor.value),
              );
            }
          } else if (user.role == 'admin') {
            Get.offNamed(Routes.HOME_ADMIN); // Navigasi ke halaman Admin
            _showSnackbar(
              title: 'Success',
              message: 'Berhasil Login, Selamat datang di aplikasi KoNT.',
              color: Color(Success.mainColor.value),
            );
          } else {
            _showSnackbar(
              title: 'Login Gagal',
              message: 'Role tidak ditemukan',
              color: Error.mainColor,
            );
          }
        } else {
          _showSnackbar(
            title: 'Login Gagal',
            message: 'Username dan password tidak sesuai',
            color: Error.mainColor,
          );
        }
      } catch (e) {
        _showSnackbar(
          title: 'Login Gagal',
          message: 'Terjadi kesalahan: $e',
          color: Error.mainColor,
        );
      }
    } else {
      _showSnackbar(
        title: 'Login Gagal',
        message: 'Username dan password tidak boleh kosong',
        color: Neutral.neutral_300,
      );
    }
  }

  void _showSnackbar({
    required String title,
    required String message,
    required Color color,
  }) {
    Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      backgroundColor: color.withOpacity(0.8),
    );
  }

  void UpdatePassword(int id, String pin) async {
    try {
      final response = await loginService.updatePassword(id, pin);
      if (response.statusCode == 200) {
        print("Pin Berhasil Diperbarui");
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }
}
