import 'package:flutter/material.dart';
import 'package:flutter_oat_mobile/src/common/constants/shared_prefs_constants.dart';
import 'package:flutter_oat_mobile/src/common/providers/shared_preferences/shared_preferences_providers.dart';
import 'package:flutter_oat_mobile/src/config/routes/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_listenable.g.dart';

@riverpod
class RouterListenable extends _$RouterListenable implements Listenable {
  VoidCallback? _routerListener;
  bool _isAuth = false;

  @override
  Future<void> build() async {
    _isAuth = await ref.watch(
      sharedPreferencesProvider.selectAsync(
        (data) => data.getBool(SharedPrefsConstants.isAuth.name) ?? false,
      ),
    );

    ref.listenSelf((previous, next) {
      if (state.isLoading) {
        return;
      }
      _routerListener?.call();
    });
  }

  String? redirect(BuildContext context, GoRouterState state) {
    if (this.state.isLoading || this.state.hasError) {
      return null;
    }

    final isGreeting = state.fullPath == AppRoutes.greetingRoute;

    if (isGreeting) {
      return _isAuth ? AppRoutes.rootRoute : null;
    }

    final isGreetingTeacher = state.fullPath == AppRoutes.greetingTeacherRoute;

    if (isGreetingTeacher) {
      return _isAuth ? AppRoutes.rootRoute : null;
    }

    return _isAuth ? null : AppRoutes.greetingRoute;
  }

  @override
  void addListener(VoidCallback listener) {
    _routerListener = listener;
  }

  @override
  void removeListener(VoidCallback listener) {
    _routerListener = null;
  }
}
