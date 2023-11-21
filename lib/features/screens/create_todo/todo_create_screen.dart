import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_riverpod/core/helpers/helpers.dart';
import 'package:todo_list_riverpod/features/screens/create_todo/components/data_time.dart';
import 'package:todo_list_riverpod/features/screens/create_todo/components/reminder.dart';
import 'package:todo_list_riverpod/features/widgets/text_field.dart';

import 'components/build_input.dart';

class TodoCreateScreen extends ConsumerStatefulWidget {
  const TodoCreateScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TodoCreateScreenState();
}

class _TodoCreateScreenState extends ConsumerState<TodoCreateScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _notesController;

  @override
  void initState() {
    _titleController = TextEditingController();
    _notesController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            TodoHelpers.createTodo(
                context, _titleController.text, _notesController.text, ref);
          },
          label: const Text('Create Todo')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: ListView(
          children: [
            BuildInput(
              title: 'Title',
              widget: TodoTextFormField(
                  controller: _titleController, hintText: 'Enter Title'),
            ),
            const SizedBox(
              height: 10,
            ),
            BuildInput(
              title: 'Note',
              widget: TodoTextFormField(
                  controller: _notesController, hintText: 'Enter Note'),
            ),
            const SizedBox(
              height: 10,
            ),
            const TodoDateTime(),
            const SizedBox(
              height: 10,
            ),
            const BuildInput(title: 'Remind', widget: TodoReminder()),
          ],
        ),
      ),
    );
  }
}
