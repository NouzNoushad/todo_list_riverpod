import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_riverpod/config/routes/route_contant.dart';
import 'package:todo_list_riverpod/core/helpers/helpers.dart';
import 'package:todo_list_riverpod/features/riverpod/completed_provider.dart';
import 'package:todo_list_riverpod/features/riverpod/todo_provider/provider/todo_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoProvider).todo;
    final isCompleted = ref.watch(completedProvider);
    final selectedIndex = ref.watch(selectedIndexProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(RouteConstant.create);
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            var todo = todoList[index];
            return ListTile(
              title: Text(
                todo.title,
              ),
              leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.date,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      todo.time,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ]),
              subtitle: Text(
                todo.note,
              ),
              trailing: Checkbox(
                onChanged: (value) => TodoHelpers.todoCompleted(
                    context, value, index, todo.id, ref),
                value: selectedIndex == index ? isCompleted : false,
              ),
            );
          }),
    );
  }
}
