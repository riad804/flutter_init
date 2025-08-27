import 'package:flutter/material.dart';
import 'package:flutter_init/core/common/widgets/base_screen.dart';
import '../../../../core/rx/rx_state.dart';
import '../domain/entities/todo.dart';
import 'view_model/todo_vm.dart';

class TodoPage extends BaseScreen<TodoVM> {
  const TodoPage({super.key});


  @override
  onInit() {
    getVM.fetch();
  }

  @override
  onDispose() {
  }

  @override
  Widget build(BuildContext context, TodoVM vm) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todos')),
      body: StreamBuilder<RxState<List<Todo>>>(
        stream: vm.state,
        builder: (context, snapshot) {
          final s = snapshot.data;
          if (s is RxLoading<List<Todo>>) return const Center(child: CircularProgressIndicator());
          if (s is RxError<List<Todo>>) return Center(child: Text(s.failure.message));
          if (s is RxData<List<Todo>>) {
            final todos = s.data;
            return ListView.separated(
              itemCount: todos.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (_, i) => ListTile(
                title: Text(todos[i].title),
                trailing: Icon(todos[i].completed ? Icons.check_circle : Icons.radio_button_unchecked),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
