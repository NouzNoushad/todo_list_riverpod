import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_riverpod/features/data_source/todo_datasource.dart';

final todoDataSourceProvider = Provider<TodoDataSource>((ref) {
  return TodoDataSourceImpl();
});