import 'package:flutter/material.dart';
import 'package:flutter_oat_mobile/src/common/assets/assets.dart';
import 'package:flutter_oat_mobile/src/common/extensions/context_extensions.dart';
import 'package:flutter_oat_mobile/src/common/widgets/svg_icon.dart';
import 'package:flutter_oat_mobile/src/config/routes/main_wrapper/main_bottom_nav_bar.dart';
import 'package:go_router/go_router.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({
    super.key,
    required this.child,
  });

  final StatefulNavigationShell child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: MainBottomNavBar(
        items: [
          BottomNavigationBarItem(
            label: context.localizations.home,
            icon: SvgIcon(
              icon: Assets.homeIcon,
              color: child.currentIndex == 0
                  ? context.theme.colorScheme.onPrimary
                  : context.theme.colorScheme.primary.withOpacity(.4),
            ),
          ),
          BottomNavigationBarItem(
            label: context.localizations.services,
            icon: SvgIcon(
              icon: Assets.servicesIcon,
              color: child.currentIndex == 1
                  ? context.theme.colorScheme.onPrimary
                  : context.theme.colorScheme.primary.withOpacity(.4),
            ),
          ),
        ],
        currentIndex: child.currentIndex,
        onTap: child.goBranch,
      ),
    );
  }
}
