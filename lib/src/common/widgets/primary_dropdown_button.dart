import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_oat_mobile/src/common/extensions/context_extensions.dart';
import 'package:flutter_oat_mobile/src/config/styles/dimensions.dart';

class PrimaryDropdownButton<T> extends StatelessWidget {
  const PrimaryDropdownButton({
    super.key,
    required this.items,
    required this.onChanged,
    required this.value,
    this.hint,
  });

  final List<DropdownMenuItem<T>>? items;
  final ValueChanged<T?> onChanged;
  final T? value;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(
            cornerRadius: AppDimensions.small,
            cornerSmoothing: 1,
          ),
        ),
        color: context.theme.colorScheme.background,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          hint: hint != null
              ? Text(
                  hint!,
                  style: context.theme.textTheme.bodyMedium?.copyWith(
                    color: context.theme.colorScheme.primary.withOpacity(.4),
                  ),
                )
              : null,
          elevation: 0,
          style: context.theme.textTheme.bodyMedium,
          borderRadius: SmoothBorderRadius(
            cornerRadius: AppDimensions.small,
            cornerSmoothing: 1,
          ),
          items: items,
          onChanged: onChanged,
          padding: const EdgeInsets.symmetric(horizontal: 12),
        ),
      ),
    );
  }
}
