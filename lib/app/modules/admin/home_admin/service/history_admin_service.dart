import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../../../data/api.dart';

class HistoryAdminService {
  final Dio _dio = Dio();
  final String _baseUrl = baseUrl;
  final String _apiKey = apiKey;
  final Logger logger = Logger();

  Future<dynamic> historyAdmin(int id) async {
    var baseUrl = '${_baseUrl}history_transaksi?ststus=eq.true&select=*';
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
        logger.i('Success get history users');
        logger.i(response.data);
        if (response.data.isNotEmpty) {
          return response.data; // Ambil objek pertama
        } else {
          logger.e('History user not found');
          return null;
        }
      } else {
        logger.e('Failed to load history user: ${response.statusCode}');
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
}
