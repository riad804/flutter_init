import 'package:flutter/material.dart';
import 'package:flutter_init/core/common/widgets/base_screen.dart';
import 'package:rx_state_manager/rx_state_manager.dart';
import '../domain/entities/todo.dart';
import 'controllers/todo_controller.dart';

class TodoPage extends BaseScreen<TodoController> {
  const TodoPage({super.key});

  @override
  TodoController get controller => TodoController();


  @override
  Widget buildScreen(BuildContext context, TodoController controller) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todos')),
      body: ObRx(
        listenTo: [controller.state],
        builder: () => controller.state.value.when(
          idle: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          onData: (data) {
            return ListView.separated(
              itemCount: data.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (_, i) => ListTile(
                title: Text(data[i].title),
                trailing: Icon(data[i].completed ? Icons.check_circle : Icons.radio_button_unchecked),
              ),
            );
          },
          onError: (err) => Text("Error: ${err.message}"),
        ),
      ),
    );
  }
}
