import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_riverpod/features/data_source/todo_datasource.dart';
import 'package:todo_list_riverpod/features/riverpod/todo_provider/state/todo_state.dart';

import '../../../model/todo_model.dart';

class TodoNotifier extends StateNotifier<TodoState> {
  final TodoDataSource todoDataSource;
  TodoNotifier({required this.todoDataSource}) : super(TodoState.initial()) {
    getTodoList();
  }

  Future<void> getTodoList() async {
    try {
      List<TodoModel> todoList = await todoDataSource.getTodoList();
      state = state.copyWith(todo: todoList);
    } catch (err) {
      debugPrint('Error: $err');
    }
  }

  Future<void> addTodo(TodoModel todo) async {
    try {
      await todoDataSource.addTodo(todo);
      getTodoList();
    } catch (err) {
      debugPrint('Error: $err');
    }
  }

  Future<void> deleteTodo(String todoId) async {
    try {
      await todoDataSource.deleteTodo(todoId);
      getTodoList();
    } catch (err) {
      debugPrint('Error: $err');
    }
  }
}
