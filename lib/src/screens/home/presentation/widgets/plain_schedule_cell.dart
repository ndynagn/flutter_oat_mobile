import 'package:flutter/material.dart';
import 'package:flutter_oat_mobile/src/common/extensions/context_extensions.dart';

class PlainScheduleCell extends StatelessWidget {
  const PlainScheduleCell({
    super.key,
    required this.leading,
    required this.trailing,
  });

  final String leading;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leading,
          style: context.theme.textTheme.bodyMedium,
        ),
        Text(
          trailing,
          style: context.theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
