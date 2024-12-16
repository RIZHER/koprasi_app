import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../data/api.dart';

class AddNewUserService extends GetxService {
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

  Future<dio.Response> addNewUser({
    required String nama_lengkap,
    required String username,
    required int no_ktp,
    required String nama_ibu,
    required String alamat,
  }) async {
    Logger().i(
        'Request data: nama_lengkap=$nama_lengkap, username=$username, no_ktp=$no_ktp, nama_ibu=$nama_ibu, alamat=$alamat');
    try {
      final dio.Response response = await _dio.post(
        'users',
        data: {
          "username": username,
          "password": "123456",
          "no_ktp": no_ktp,
          "nama_lengkap": nama_lengkap,
          "nama_ibu": nama_ibu,
          "alamat": alamat,
          "saldo": 0,
          "role": "user"
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
