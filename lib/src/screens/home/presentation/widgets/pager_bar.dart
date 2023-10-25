import 'package:flutter/material.dart';
import 'package:flutter_oat_mobile/src/common/extensions/context_extensions.dart';
import 'package:flutter_oat_mobile/src/common/extensions/widget_modifier.dart';

class PagerBar extends StatelessWidget {
  const PagerBar({
    super.key,
    required this.selectedPage,
    required this.pages,
    required this.onTap,
  });

  final int selectedPage;
  final List<String> pages;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          pages.length,
          (index) => GestureDetector(
            onTap: () => onTap(index),
            child: Text(
              pages[index],
              style: context.theme.textTheme.bodyMedium?.copyWith(
                color: selectedPage == index
                    ? context.theme.colorScheme.primary
                    : context.theme.colorScheme.primary.withOpacity(.4),
              ),
            ),
          ),
        ),
      ).padding(
        const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
      ),
    );
  }
}
