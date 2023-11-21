import 'package:flutter/material.dart';

import '../../../../core/utils/constant.dart';

class BuildInput extends StatelessWidget {
  final String title;
  final Widget widget;
  const BuildInput({super.key,
  required this.title,
  required this.widget});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: kTitleTextStyle,
        ),
        const SizedBox(
          height: 8,
        ),
        widget
      ],
    );
  }
}
