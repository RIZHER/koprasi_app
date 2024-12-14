import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:koperasi_app/constant/constant.dart';
import 'package:koperasi_app/utils/global_components/main_button.dart';
import 'package:koperasi_app/utils/global_components/text_input_field.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Container(
              // color: Colors.amber,
              height: 680,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: SvgPicture.asset('assets/images/logo.svg'),
                  ),
                  Gap(57),
                  Text(
                    "Selamat Datang Kembali",
                    style: semiBold.copyWith(
                      fontSize: 22,
                      color: Black.black_500,
                    ),
                  ),
                  Text(
                    "Masukan username dan PIN",
                    style: regular.copyWith(
                      fontSize: 12,
                      color: Black.black_500,
                    ),
                  ),
                  Gap(20),
                  Text(
                    "Username",
                    style: semiBold.copyWith(
                      fontSize: 12,
                      color: Black.black_500,
                    ),
                  ),
                  Gap(10),
                  InputField(
                    title: 'Masukkan username',
                    onChanged: controller.setUsernameLogin,
                  ),
                  Gap(20),
                  Text(
                    "Password",
                    style: semiBold.copyWith(
                      fontSize: 12,
                      color: Black.black_500,
                    ),
                  ),
                  Gap(10),
                  Obx(
                    () => InputField(
                      title: 'Masukkan password',
                      onChanged: controller.setPasswordLogin,
                      obscureText: controller.obscureText.value,
                      icon: GestureDetector(
                        onTap: () {
                          controller.obscureText.value =
                              !controller.obscureText.value;
                        },
                        child: SvgPicture.asset(
                          controller.obscureText.value
                              ? 'assets/icons/eye-closed.svg'
                              : 'assets/icons/eye-open.svg',
                        ),
                      ),
                      errorIcon: SvgPicture.asset(
                        'assets/icons/error-icon.svg',
                      ),
                    ),
                  ),
                  Gap(40),
                  MainButton(
                    label: 'Masuk',
                    onTap: () {
                      controller.doLogin();
                    },
                  ),
                  Container(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
