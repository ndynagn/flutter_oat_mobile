import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
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
    final theme = Theme.of(context);
    return Container(
      decoration: ShapeDecoration(
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(
            cornerRadius: AppDimensions.small,
            cornerSmoothing: 1,
          ),
        ),
        color: theme.colorScheme.background,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          hint: hint != null
              ? Text(
                  hint!,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.primary.withOpacity(.4),
                  ),
                )
              : null,
          elevation: 0,
          style: theme.textTheme.bodyMedium,
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
