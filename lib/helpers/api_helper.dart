import 'package:dio/dio.dart' as dio_pkg;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:localstorage/localstorage.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class DioHelper {
  late dio_pkg.Dio dio;
  final FlutterSecureStorage? secureStorage;
  final String baseUrl;

  DioHelper({required this.baseUrl, this.secureStorage}) {
    dio =
        dio_pkg.Dio(dio_pkg.BaseOptions(baseUrl: baseUrl))
          ..interceptors.add(
            dio_pkg.InterceptorsWrapper(
              onRequest: (options, handler) async {
                String? token;
                if (secureStorage != null) {
                  token = await secureStorage?.read(key: 'access_token');
                } else {
                  token = localStorage.getItem('access_token');
                }
                if (token != null) {
                  options.headers['Authorization'] = 'Bearer $token';
                }
                return handler.next(options);
              },
              onError: (dio_pkg.DioException error, handler) async {
                if (error.response?.statusCode == 401) {
                  if (await _refreshToken()) {
                    return handler.resolve(await _retry(error.requestOptions));
                  }
                }
                return handler.next(error);
              },
            ),
          )
          ..interceptors.add(TalkerDioLogger());
  }
  Future<bool> _refreshToken() async {
    try {
      String? refreshToken;
      if (secureStorage != null) {
        refreshToken = await secureStorage?.read(key: 'refresh_token');
      } else {
        refreshToken = localStorage.getItem('refresh_token');
      }
      if (refreshToken == null) return false;
      final response = await dio.post(
        '/auth/refresh',
        data: {'refresh_token': refreshToken},
      );
      if (response.statusCode == 200) {
        String newToken = response.data['access_token'];
        if (secureStorage != null) {
          await secureStorage?.write(key: 'access_token', value: newToken);
        } else {
          localStorage.setItem('access_token', newToken);
        }
        return true;
      }
    } catch (_) {}
    return false;
  }

  Future<dio_pkg.Response<dynamic>> _retry(
    dio_pkg.RequestOptions requestOptions,
  ) async {
    final newOptions = dio_pkg.Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: newOptions,
    );
  }

  Future<dio_pkg.Response> get(
    String endpoint, {
    Map<String, dynamic>? params,
  }) async {
    return dio.get(endpoint, queryParameters: params);
  }

  Future<dio_pkg.Response> post(String endpoint, {dynamic data}) async {
    return dio.post(endpoint, data: data);
  }

  Future<dio_pkg.Response> put(String endpoint, {dynamic data}) async {
    return dio.put(endpoint, data: data);
  }

  Future<dio_pkg.Response> delete(String endpoint, {dynamic data}) async {
    return dio.delete(endpoint, data: data);
  }
}
