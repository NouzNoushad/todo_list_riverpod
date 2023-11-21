import 'package:flutter/material.dart';
import 'package:todo_list_riverpod/core/utils/constant.dart';

class TodoTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  const TodoTextFormField(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        style: const TextStyle(
          decorationThickness: 0,
        ),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: kOutlineInputBorder,
          focusedBorder: kOutlineInputBorder,
        ));
  }
}
