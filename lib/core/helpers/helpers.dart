import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo_list_riverpod/config/routes/route_contant.dart';
import 'package:todo_list_riverpod/features/model/todo_model.dart';
import 'package:todo_list_riverpod/features/riverpod/completed_provider.dart';
import 'package:todo_list_riverpod/features/riverpod/date_provider.dart';
import 'package:todo_list_riverpod/features/riverpod/remind_provider.dart';
import 'package:todo_list_riverpod/features/riverpod/time_provider.dart';
import 'package:todo_list_riverpod/features/riverpod/todo_provider/provider/todo_provider.dart';
import 'package:uuid/uuid.dart';

@immutable
class TodoHelpers {
  static void selectDate(BuildContext context, WidgetRef ref) async {
    final DateTime initialDate = ref.watch(dateProvider);
    DateTime? datePicker = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(2022),
        lastDate: DateTime(2030));
    if (datePicker != null) {
      ref.read(dateProvider.notifier).state = datePicker;
    }
  }

  static String dateToString(DateTime dateTime) {
    try {
      return DateFormat.yMMMd().format(dateTime);
    } catch (err) {
      return DateFormat.yMMMd().format(DateTime.now());
    }
  }

  static void selectTime(BuildContext context, WidgetRef ref) async {
    final TimeOfDay initialTime = ref.watch(timeProvider);
    TimeOfDay? timePicker =
        await showTimePicker(context: context, initialTime: initialTime);
    if (timePicker != null) {
      ref.read(timeProvider.notifier).state = timePicker;
    }
  }

  static String timeToString(TimeOfDay timeOfDay) {
    DateTime now = DateTime.now();
    TimeOfDay time = TimeOfDay.now();
    try {
      return DateFormat.jm().format(DateTime(
          now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute));
    } catch (err) {
      return DateFormat.jm().format(
          DateTime(now.year, now.month, now.day, time.hour, time.minute));
    }
  }

  static void onChangeReminder(int? value, WidgetRef ref) {
    final int? selectedValue = ref.watch(remindProvider);
    if (selectedValue != null) {
      ref.read(remindProvider.notifier).state = value;
    }
  }

  static void createTodo(
      BuildContext context, String title, String note, WidgetRef ref) async {
    final id = const Uuid().v4();
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    final remind = ref.watch(remindProvider);
    if (title != '') {
      TodoModel todoModel = TodoModel(
          title.trim(),
          TodoHelpers.dateToString(date),
          note.trim(),
          remind.toString(),
          TodoHelpers.timeToString(time),
          id);

      await ref.read(todoProvider.notifier).addTodo(todoModel).then((value) {
        debugPrint('Todo Added');
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Todo Added Successfully')));
        Navigator.of(context).pushNamed(RouteConstant.home);
      });

      title = '';
      note = '';
      ref.read(dateProvider.notifier).state = DateTime.now();
      ref.read(timeProvider.notifier).state = TimeOfDay.now();
      ref.read(remindProvider.notifier).state = 3;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Title should not be empty')));
    }
  }

  static void todoCompleted(BuildContext context, bool? value, int index,
      String todoId, WidgetRef ref) {
    final isCompleted = ref.watch(completedProvider);
    if (isCompleted != null) {
      ref.read(completedProvider.notifier).state = value;
      ref.read(selectedIndexProvider.notifier).state = index;
      Future.delayed(const Duration(seconds: 1), () {
        ref.watch(todoProvider.notifier).deleteTodo(todoId);
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Todo Completed')));
      });
    }
    Future.delayed(const Duration(seconds: 1), () {
      ref.read(selectedIndexProvider.notifier).state = -1;
    });
  }
}
