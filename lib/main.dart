import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_list_riverpod/app.dart';
import 'package:todo_list_riverpod/features/model/todo_model.dart';

import 'core/utils/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>(AppStrings.database);
  runApp(const ProviderScope(child: MyApp()));
}
