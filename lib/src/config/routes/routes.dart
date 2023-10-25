import 'package:flutter_oat_mobile/src/config/routes/main_wrapper/main_wrapper.dart';
import 'package:flutter_oat_mobile/src/screens/greeting/presentation/greeting_screen.dart';
import 'package:flutter_oat_mobile/src/screens/greeting_teacher/presentation/greeting_teacher_screen.dart';
import 'package:flutter_oat_mobile/src/screens/home/presentation/home_screen.dart';
import 'package:flutter_oat_mobile/src/screens/services/presentation/services_screen.dart';
import 'package:flutter_oat_mobile/src/screens/settings/presentation/settings_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  const AppRoutes._();

  static const greetingRoute = '/greeting';
  static const greetingTeacherRoute = '/greetingTeacher';
  static const rootRoute = '/';
  static const settingsRoute = '/settings';
  static const servicesRoute = '/services';

  static final routes = [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainWrapper(
          key: state.pageKey,
          child: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: rootRoute,
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: HomeScreen(),
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: servicesRoute,
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: ServicesScreen(),
                );
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: greetingRoute,
      builder: (context, state) => const GreetingScreen(),
    ),
    GoRoute(
      path: greetingTeacherRoute,
      builder: (context, state) => const GreetingTeacherScreen(),
    ),
    GoRoute(
      path: settingsRoute,
      builder: (context, state) => const SettingsScreen(),
    ),
  ];
}
