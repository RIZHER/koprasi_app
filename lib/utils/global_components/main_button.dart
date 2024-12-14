import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class MainButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  final bool isEnabled;

  const MainButton({
    required this.label,
    this.onTap,
    this.isEnabled = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // Agar InkWell bisa bekerja dengan benar
      child: InkWell(
        onTap:
            isEnabled ? onTap : null, // Jika tombol aktif, onTap akan dipanggil
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 13),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isEnabled
                ? Primary.main
                : Neutral.neutral_100, // Warna sesuai isEnabled
          ),
          child: Text(
            label,
            style: semiBold.copyWith(
                fontSize: 16,
                color: isEnabled
                    ? White.white_50
                    : Neutral.neutral_300), // Warna teks sesuai isEnabled
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
