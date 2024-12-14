import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class historyTransaksi extends StatelessWidget {
  final String jenisTransaksi;
  final String kantor;
  final String waktu;
  final String jumlahTransaksi;
  final String statusuang;
  const historyTransaksi({
    super.key,
    required this.jenisTransaksi,
    required this.kantor,
    required this.waktu,
    required this.jumlahTransaksi,
    required this.statusuang,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$jenisTransaksi",
                  style: bold.copyWith(
                    fontSize: 16,
                    color: jenisTransaksi != "Setor Tunai"
                        ? Error.mainColor
                        : Success.mainColor,
                  ),
                ),
                Text(
                  "$kantor",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: medium.copyWith(
                    fontSize: 16,
                    color: Neutral.neutral_400,
                  ),
                ),
                Text(
                  "$waktu",
                  style: regular.copyWith(
                    fontSize: 12,
                    color: Neutral.neutral_200,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "$jumlahTransaksi",
                  style: semiBold.copyWith(
                    fontSize: 14,
                    color: jenisTransaksi != "Setor Tunai"
                        ? Error.mainColor
                        : Success.mainColor,
                  ),
                ),
                Text(
                  "$statusuang",
                  style: regular.copyWith(
                    fontSize: 14,
                    color: Neutral.neutral_300,
                  ),
                ),
              ],
            )
          ],
        ),
        Divider(
          color: Colors.black, // Warna divider
          height: 20,
          thickness: 0.8, // Ketebalan divider (default adalah 0.0)
        )
      ],
    );
  }
}
