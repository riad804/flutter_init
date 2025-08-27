import '../../../../core/either.dart';
import '../../../../core/failure.dart';
import '../entities/todo.dart';


abstract interface class TodoRepository {
  Future<Either<Failure, List<Todo>>> getTodos();
}