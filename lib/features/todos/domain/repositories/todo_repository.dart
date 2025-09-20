import 'package:rx_state_manager/rx_state_manager.dart';

import '../../../../core/either.dart';
import '../entities/todo.dart';


abstract interface class TodoRepository {
  Future<Either<Failure, List<Todo>>> getTodos();
}