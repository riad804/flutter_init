import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../core/rx/rx_view_model.dart';
import '../../../../core/rx/rx_state.dart';
import '../../../../core/usecase.dart';
import '../../domain/entities/todo.dart';
import '../../domain/usecases/get_todos.dart';

@singleton
class TodoVM extends RxViewModel<List<Todo>> {
  final GetTodos _getTodos;
  TodoVM(this._getTodos);


  Future<void> fetch() async {
    setLoading();
    final res = await _getTodos(const NoParams());
    res.fold(setError, (data) => setData(data));
  }


  ValueStream<RxState<List<Todo>>> get stream => state as ValueStream<RxState<List<Todo>>>;
}