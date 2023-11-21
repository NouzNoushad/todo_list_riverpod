import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_riverpod/core/helpers/helpers.dart';
import 'package:todo_list_riverpod/core/utils/extension.dart';
import 'package:todo_list_riverpod/features/riverpod/remind_provider.dart';

import '../../../../core/utils/colors.dart';

class TodoReminder extends ConsumerWidget {
  const TodoReminder({super.key});
  static List<int> hours = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  static int selectedValue = 1;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedValue = ref.watch(remindProvider);
    return Container(
        height: context.height * 0.09,
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1.5, color: ColorPicker.borderColor),
        ),
        child: SizedBox(
          height: context.height * 0.3,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
                isExpanded: false,
                value: selectedValue,
                onChanged: (value) => TodoHelpers.onChangeReminder(value, ref),
                items: List.generate(
                    hours.length,
                    (index) => DropdownMenuItem<int>(
                          value: hours[index],
                          child: Center(
                            child: Text(
                              '${hours[index]} minutes early',
                              style:
                                  const TextStyle(color: ColorPicker.textColor),
                            ),
                          ),
                        ))),
          ),
        ));
  }
}
