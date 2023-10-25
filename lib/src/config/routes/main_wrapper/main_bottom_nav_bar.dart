import 'package:flutter/material.dart';
import 'package:flutter_oat_mobile/src/common/extensions/context_extensions.dart';

class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    this.onTap,
  });

  final List<BottomNavigationBarItem> items;
  final ValueChanged<int>? onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: context.theme.colorScheme.primary.withOpacity(.08),
          ),
        ),
      ),
      child: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        items: items,
        useLegacyColorScheme: false,
      ),
    );
  }
}
