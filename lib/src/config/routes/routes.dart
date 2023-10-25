import 'package:flutter/foundation.dart';
import 'package:flutter_oat_mobile/src/config/routes/main_wrapper/main_wrapper.dart';
import 'package:flutter_oat_mobile/src/screens/greeting/presentation/greeting_screen.dart';
import 'package:flutter_oat_mobile/src/screens/greeting_teacher/presentation/greeting_teacher_screen.dart';
import 'package:flutter_oat_mobile/src/screens/home/presentation/home_screen.dart';
import 'package:flutter_oat_mobile/src/screens/profile/presentation/profile_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  const AppRoutes._();

  static const greetingRoute = '/greeting';
  static const greetingTeacherRoute = 'teacher';
  static const rootRoute = '/';
  static const profileRoute = '/profile';

  static final router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: greetingRoute,
    routes: [
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
                path: profileRoute,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(
                    child: ProfileScreen(),
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
        routes: [
          GoRoute(
            path: greetingTeacherRoute,
            builder: (context, state) => const GreetingTeacherScreen(),
          ),
        ],
      ),
    ],
  );
}
