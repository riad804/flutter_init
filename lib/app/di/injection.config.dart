// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_init/app/env.dart' as _i528;
import 'package:flutter_init/core/network/dio_client.dart' as _i982;
import 'package:flutter_init/core/network/retrofit_client.dart' as _i596;
import 'package:flutter_init/core/services/connectivity_service.dart' as _i499;
import 'package:flutter_init/core/services/theme_service.dart' as _i86;
import 'package:flutter_init/features/todos/data/repositories/todo_repository_impl.dart'
    as _i163;
import 'package:flutter_init/features/todos/data/sources/todo_api.dart'
    as _i998;
import 'package:flutter_init/features/todos/domain/repositories/todo_repository.dart'
    as _i450;
import 'package:flutter_init/features/todos/domain/usecases/get_todos.dart'
    as _i344;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    final todoApiModule = _$TodoApiModule();
    gh.singleton<_i499.ConnectivityService>(() => _i499.ConnectivityService());
    gh.singleton<_i86.ThemeService>(() => _i86.ThemeService());
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.lazySingleton<_i998.TodoApi>(
      () =>
          todoApiModule.provideTodoApi(gh<_i361.Dio>(), gh<_i528.EnvConfig>()),
    );
    gh.factoryParam<_i596.ApiConfig, String, dynamic>(
      (baseUrl, _) => _i596.ApiConfig(baseUrl),
    );
    gh.lazySingleton<_i450.TodoRepository>(
      () => _i163.TodoRepositoryImpl(gh<_i998.TodoApi>()),
    );
    gh.lazySingleton<_i344.GetTodos>(
      () => _i344.GetTodos(gh<_i450.TodoRepository>()),
    );
    return this;
  }
}

class _$DioModule extends _i982.DioModule {}

class _$TodoApiModule extends _i998.TodoApiModule {}
