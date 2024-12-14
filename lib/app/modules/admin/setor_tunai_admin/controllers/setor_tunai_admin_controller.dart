import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:koperasi_app/constant/constant.dart';

import '../../../../routes/app_pages.dart';

class SetorTunaiAdminController extends GetxController {
  Future<void> doSetor() async {
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
  }
}
