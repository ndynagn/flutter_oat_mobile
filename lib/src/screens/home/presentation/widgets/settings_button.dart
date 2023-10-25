import 'package:flutter/material.dart';
import 'package:flutter_oat_mobile/src/common/assets/assets.dart';
import 'package:flutter_oat_mobile/src/common/extensions/context_extensions.dart';
import 'package:flutter_oat_mobile/src/common/widgets/svg_icon.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: context.theme.colorScheme.secondary,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        icon: const SvgIcon(icon: Assets.settingsIcon),
      ),
    );
  }
}
