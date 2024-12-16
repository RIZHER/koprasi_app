import 'package:dio/dio.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import '../../../data/api.dart';
import '../../../data/model/user_model.dart';

class LoginService {
  final Dio _dio = Dio();
  final String _baseUrl = baseUrl;
  final String _apiKey = apiKey;
  final Logger logger = Logger();

  // final _storage = GetStorage();

  Future<Login?> loginUsers(String username, String password) async {
    var baseUrl =
        '${_baseUrl}users?username=eq.$username&password=eq.$password&select=*';
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
          // Ambil ID dari response dan simpan ke GetStorage
          final id = response.data[0]['id'];
          // _storage.write('id', id); // Simpan id ke GetStorage
          logger.i('ID saved to GetStorage: $id');

          // Return Login model
          return Login.fromJson(response.data[0]);
        } else {
          logger.e('User not found');
          return null;
        }
      } else {
        logger.e('Failed to load profile: ${response.statusCode}');
        return null;
      }
    } on DioException catch (dioError) {
      logger.e('DioError: ${dioError.response?.data}');
      return null;
    } catch (e) {
      logger.e('Unknown error: $e');
      return null;
    }
  }

  Future<Response> updatePassword(int id, String password) async {
    var baseUrl = '${_baseUrl}users?id=eq.$id';
    final response = await _dio.patch(
      baseUrl,
      data: {
        "password": password,
      },
      options: Options(
        headers: {
          'apikey': _apiKey,
          'Authorization': 'Bearer $_apiKey',
          'Content-Type': 'application/json',
          'Prefer': 'return=representation',
        },
      ),
    );
    return response;
  }
}
