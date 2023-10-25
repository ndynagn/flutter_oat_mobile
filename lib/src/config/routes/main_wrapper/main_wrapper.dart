import 'package:flutter/material.dart';
import 'package:flutter_oat_mobile/src/config/routes/main_wrapper/main_bottom_nav_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({
    super.key,
    required this.child,
  });

  final StatefulNavigationShell child;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: child,
      bottomNavigationBar: MainBottomNavBar(
        items: [
          BottomNavigationBarItem(
            label: localizations.home,
            icon: Icon(Icons.abc),
          ),
          BottomNavigationBarItem(
            label: localizations.profile,
            icon: Icon(Icons.ac_unit_outlined),
          ),
        ],
        currentIndex: child.currentIndex,
        onTap: child.goBranch,
      ),
    );
  }
}
