import 'package:flutter/material.dart';
import 'package:flutter_init/app/router/shell_router.dart';
import 'package:go_router/go_router.dart';

import '../../features/todos/presentation/todo_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => MaterialPage(child: TodoPage()),
    ),

    // deep link example
    // GoRoute(
    //   path: '/todo/:id',
    //   pageBuilder: (context, state) {
    //     final todoId = state.pathParameters['id']!;
    //     return MaterialPage(child: TodoDetailPage(todoId: todoId));
    //   },
    // ),
  ],
);
