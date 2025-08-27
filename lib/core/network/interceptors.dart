import 'package:dio/dio.dart';


class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // print minimal logs to not flood in production
    // print('➡️ ${options.method} ${options.path}');
    super.onRequest(options, handler);
  }


  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // print('❌ ${err.message}');
    super.onError(err, handler);
  }
}