import 'package:flutter/material.dart';
import 'package:flutter_oat_mobile/src/common/extensions/context_extensions.dart';
import 'package:flutter_oat_mobile/src/common/widgets/svg_icon.dart';

class SettingsCell extends StatelessWidget {
  const SettingsCell({
    super.key,
    required this.icon,
    required this.title,
  });

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgIcon(icon: icon),
        const SizedBox(width: 12),
        Text(
          title,
          style: context.theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
