import 'package:flutter/material.dart';
import 'package:todo_list_riverpod/config/routes/route_contant.dart';
import 'package:todo_list_riverpod/features/screens/home/home_screen.dart';
import 'package:todo_list_riverpod/features/screens/create_todo/todo_create_screen.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.home:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstant.home),
            builder: (context) => const HomeScreen());
      case RouteConstant.create:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstant.create),
            builder: (context) => const TodoCreateScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Text('No Page Found'),
                  ),
                ));
    }
  }
}
