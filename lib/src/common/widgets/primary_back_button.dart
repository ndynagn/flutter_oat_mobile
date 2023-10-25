import 'package:flutter/material.dart';
import 'package:flutter_oat_mobile/src/common/assets/assets.dart';
import 'package:flutter_oat_mobile/src/common/extensions/context_extensions.dart';
import 'package:flutter_oat_mobile/src/common/widgets/svg_icon.dart';

class PrimaryBackButton extends StatelessWidget {
  const PrimaryBackButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 17,
          backgroundColor: context.theme.colorScheme.secondary,
          child: IconButton(
            padding: const EdgeInsets.all(6.8),
            onPressed: onPressed,
            icon: RotatedBox(
              quarterTurns: 2,
              child: SvgIcon(
                icon: Assets.arrowRightIcon,
                color: context.theme.colorScheme.primary,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          context.localizations.back,
          style: context.theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
