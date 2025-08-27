import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'interceptors.dart';


@module
abstract class DioModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
      responseType: ResponseType.json,
      validateStatus: (s) => s != null && s >= 200 && s < 400,
    ));
    dio.interceptors.addAll([
      LoggingInterceptor(),
    ]);
    return dio;
  }
}