import 'package:flutter/material.dart';
import 'package:todo_list_riverpod/config/routes/app_route.dart';
import 'package:todo_list_riverpod/config/routes/route_contant.dart';
import 'package:todo_list_riverpod/config/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: RouteConstant.home,
    );
  }
}
