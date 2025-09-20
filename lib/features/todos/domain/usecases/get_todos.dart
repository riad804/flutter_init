import 'package:rx_state_manager/rx_state_manager.dart';

import '../../../../core/either.dart';
import '../../../../core/usecase.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class GetTodos implements UseCase<List<Todo>, NoParams> {
  final TodoRepository _repo;
  GetTodos(this._repo);


  @override
  Future<Either<Failure, List<Todo>>> call(NoParams params) => _repo.getTodos();
}