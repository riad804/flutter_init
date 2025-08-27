import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';


// Keep this file as placeholder if you want to share baseUrl/env.
@injectable
class ApiConfig {
  final String baseUrl;
  const ApiConfig(@factoryParam this.baseUrl);
}