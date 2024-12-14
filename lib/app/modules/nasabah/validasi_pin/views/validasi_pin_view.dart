import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:koperasi_app/utils/global_components/main_button.dart';
import 'package:pinput/pinput.dart';

import '../../../../../constant/constant.dart';
import '../controllers/validasi_pin_controller.dart';

class ValidasiPinView extends GetView<ValidasiPinController> {
  const ValidasiPinView({super.key});
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Black.black_500,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: Primary.second2),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Validasi PIN',
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
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Gap(200),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Pinput(
                  length: 6, // Sesuaikan untuk 6 digit PIN
                  controller: controller.pinController,
                  focusNode: controller.focusNode,
                  defaultPinTheme: defaultPinTheme,
                  separatorBuilder: (index) => const SizedBox(width: 8),
                  validator: (value) {
                    return value?.length == 6 ? null : 'PIN harus 6 digit';
                  },
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(color: Colors.green),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyBorderWith(
                    border: Border.all(color: Colors.red),
                  ),
                ),
              ),
              Gap(100),
              MainButton(
                onTap: () {
                  if (controller.formKey.currentState?.validate() ?? false) {
                    controller.completePin(controller.pinController.text);
                  }
                },
                label: 'Submit',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
