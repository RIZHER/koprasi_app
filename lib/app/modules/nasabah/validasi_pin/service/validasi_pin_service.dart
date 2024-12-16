import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../../../../data/api.dart';

class PasswordService {
  final Dio _dio = Dio();
  final String _baseUrl = baseUrl;
  final String _apiKey = apiKey;
  final Logger logger = Logger();

  // Fungsi untuk mengecek apakah password sesuai dengan username
  Future<bool> cekPassword(String username, String password) async {
    var baseUrl =
        '${_baseUrl}users?username=eq.$username&password=eq.$password&select=id'; // hanya mengambil id untuk memeriksa keberadaan user
    try {
      final response = await _dio.get(
        baseUrl,
        options: Options(
          headers: {
            'apikey': _apiKey,
            'Authorization': 'Bearer $_apiKey',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success get users');
        logger.i(response.data);

        if (response.data.isNotEmpty) {
          // Jika ada data user
          logger.i('Password matches');
          return true; // Menandakan password sesuai dan user ditemukan
        } else {
          logger.e('Incorrect  password');
          return false; // Menandakan password atau username tidak sesuai
        }
      } else {
        logger.e('Failed to load users: ${response.statusCode}');
        return false; // Mengembalikan false jika gagal mengambil data
      }
    } on DioException catch (dioError) {
      logger.e('DioError: ${dioError.response?.data}');
      return false; // Mengembalikan false jika terjadi error saat request
    } catch (e) {
      logger.e('Unknown error: $e');
      return false; // Mengembalikan false jika ada error lainnya
    }
  }
}
