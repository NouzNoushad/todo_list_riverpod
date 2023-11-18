import 'package:flutter/material.dart';
import 'package:todo_list_riverpod/config/routes/route_contant.dart';
import 'package:todo_list_riverpod/features/screens/home_screen.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.home:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstant.home),
            builder: (context) => const HomeScreen());
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
