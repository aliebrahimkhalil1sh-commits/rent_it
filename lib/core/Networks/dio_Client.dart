import 'package:dio/dio.dart';
import 'package:rent_it/core/utils/pref_Helpers.dart';


class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://graduation-project-production-45fb.up.railway.app/api/v1',
      headers: {"contentType": 'application/json'},
    ),
  );

  DioClient() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await PrefHelper.getToken();

          if (token != null && token.isNotEmpty && token != "guest") {
            options.headers['Authorization'] = 'Bearer $token';
          }

          return handler.next(options);
        },
      ),
    );
  }

  Dio get dio => _dio;
}
