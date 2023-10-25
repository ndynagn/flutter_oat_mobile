import 'package:flutter/material.dart';
import 'package:flutter_oat_mobile/src/common/extensions/context_extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon({
    super.key,
    required this.icon,
    this.color,
    this.blendMode,
  });

  final String icon;
  final Color? color;
  final BlendMode? blendMode;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      colorFilter: ColorFilter.mode(
        color ?? context.theme.colorScheme.primary,
        blendMode ?? BlendMode.srcIn,
      ),
    );
  }
}
