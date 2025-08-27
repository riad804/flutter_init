import 'package:flutter_init/app/env.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../models/todo_model.dart';


part 'todo_api.g.dart';


@RestApi()
abstract class TodoApi {
  factory TodoApi(Dio dio, {String baseUrl}) = _TodoApi;


  @GET('/todos')
  Future<List<TodoModel>> getTodos();
}


@module
abstract class TodoApiModule {
  @lazySingleton
  TodoApi provideTodoApi(Dio dio, EnvConfig config) => TodoApi(dio, baseUrl: config.baseUrl);
}