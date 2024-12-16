import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../data/api.dart';

class SetorTunaiService extends GetxService {
  final dio.Dio _dio = dio.Dio(
    dio.BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'apikey': apiKey,
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
    ),
  );
  Future<dio.Response> addTransaksi({
    required int id,
    required String Jenis_transaksi,
    required int kode_transaksi,
    required int Jumlah_transaksi,
    required bool status,
    required String kantor,
  }) async {
    Logger().i(
        'Request data: id=$id, jenis_transaksi=$Jenis_transaksi, kode_transaksi=$kode_transaksi, jumlah_transaksi=$Jumlah_transaksi, status=$status, kantor=$kantor');
    try {
      final dio.Response response = await _dio.post(
        'history_transaksi',
        data: {
          "id_user": id,
          "jenis_transaksi": Jenis_transaksi,
          "kode_transaksi": kode_transaksi,
          "jumlah_transaksi": Jumlah_transaksi,
          "ststus": status,
          "kantor": kantor,
        },
      );

      Logger().i('Response data: ${response.data}');
      return response; // Mengembalikan respons jika sukses
    } catch (e) {
      Logger().e('Error saat menambahkan user: $e');
      rethrow; // Lempar ulang exception untuk ditangani di tempat lain
    }
  }
}
