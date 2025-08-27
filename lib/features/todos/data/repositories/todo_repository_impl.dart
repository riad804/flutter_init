import 'package:injectable/injectable.dart';
import '../../../../core/either.dart';
import '../../../../core/failure.dart';
import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';
import '../sources/todo_api.dart';


@LazySingleton(as: TodoRepository)
class TodoRepositoryImpl implements TodoRepository {
  final TodoApi _api;
  TodoRepositoryImpl(this._api);


  @override
  Future<Either<Failure, List<Todo>>> getTodos() async {
    try {
      final list = await _api.getTodos();
      return Right(list.map((e) => e.toEntity()).toList());
    } on Object catch (e, st) {
      return Left(NetworkFailure('Failed to load todos', error: e, stackTrace: st));
    }
  }
}