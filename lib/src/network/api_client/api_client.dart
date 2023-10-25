import 'package:dio/dio.dart';
import 'package:flutter_oat_mobile/src/network/api_client/errors/network_error.dart';

class ApiClient implements Interceptor {
  ApiClient({required String baseUrl}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        validateStatus: (status) {
          return status != null && status >= 200 && status < 300 ||
              status == 304;
        },
      ),
    )..interceptors.add(this);
  }

  late final Dio _dio;

  Dio get dio => _dio;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final networkError = NetworkError(err);
    handler.next(networkError);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
