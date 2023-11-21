import 'package:todo_list_riverpod/features/model/todo_model.dart';

class TodoState {
  List<TodoModel> todo;
  TodoState({required this.todo});

  TodoState.initial({this.todo = const []});

  TodoState copyWith({List<TodoModel>? todo}) {
    return TodoState(todo: todo ?? this.todo);
  }
}
