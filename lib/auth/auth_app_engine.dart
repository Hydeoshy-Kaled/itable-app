import 'package:dio/dio.dart';
import 'package:itable_app/utils/constants.dart';

class AuthAppEngine {
  final Dio _dio = Dio();

  AuthAppEngine() {
    _dio.options.baseUrl = Constants.URL_APPENGINE;
  }

  Future<Response> fetchData(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      return response;
    } catch (e) {
      print('Erro ao fazer a requisição: $e');
      rethrow;
    }
  }
}
