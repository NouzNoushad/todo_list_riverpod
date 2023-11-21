import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_riverpod/features/data_source/data_source_provider.dart';
import 'package:todo_list_riverpod/features/riverpod/todo_provider/notifier/todo_notifier.dart';
import 'package:todo_list_riverpod/features/riverpod/todo_provider/state/todo_state.dart';

final todoProvider = StateNotifierProvider<TodoNotifier, TodoState>((ref) {
  final todoDataSource = ref.watch(todoDataSourceProvider);
  return TodoNotifier(todoDataSource: todoDataSource);
});
