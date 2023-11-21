import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_riverpod/core/utils/colors.dart';
import 'package:todo_list_riverpod/core/utils/extension.dart';

import '../../../../core/helpers/helpers.dart';
import '../../../riverpod/date_provider.dart';
import '../../../riverpod/time_provider.dart';
import 'build_input.dart';

class TodoDateTime extends ConsumerWidget {
  const TodoDateTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var time = ref.watch(timeProvider);
    var date = ref.watch(dateProvider);
    return Row(
      children: [
        Expanded(
          child: BuildInput(
            title: 'Date',
            widget: DateTimeContainer(
                title: TodoHelpers.dateToString(date),
                icon: Icons.calendar_month,
                onTap: () => TodoHelpers.selectDate(context, ref)),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: BuildInput(
              title: 'Time',
              widget: DateTimeContainer(
                  title: TodoHelpers.timeToString(time),
                  icon: Icons.timer,
                  onTap: () => TodoHelpers.selectTime(context, ref))),
        )
      ],
    );
  }
}

class DateTimeContainer extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;
  const DateTimeContainer(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.height * 0.09,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1.5, color: ColorPicker.borderColor),
        ),
        child: Material(
          color: Colors.transparent,
          child: Row(children: [
            Icon(icon),
            const SizedBox(
              width: 15,
            ),
            Expanded(child: Text(title))
          ]),
        ),
      ),
    );
  }
}
