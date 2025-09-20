import 'package:rx_state_manager/rx_state_manager.dart';
import '../../../../app/di/injection.dart';
import '../../../../core/usecase.dart';
import '../../domain/entities/todo.dart';
import '../../domain/usecases/get_todos.dart';

class TodoController extends RxController {
  final GetTodos _getTodos = sl<GetTodos>();
  RxState<List<Todo>> get state => RxState<List<Todo>>();


  Future<void> fetch() async {
    state.value = const RxLoading();
    final res = await _getTodos(const NoParams());
    res.fold((f) => state.value = RxError(f), (data) => state.value = RxData(data));
  }
}