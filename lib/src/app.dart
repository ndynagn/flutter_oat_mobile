import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_oat_mobile/src/config/routes/router_listenable.dart';
import 'package:flutter_oat_mobile/src/config/routes/routes.dart';
import 'package:flutter_oat_mobile/src/config/styles/themes.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final key = useRef(GlobalKey<NavigatorState>(debugLabel: 'routerKey'));
    final notifier = ref.watch(routerListenableProvider.notifier);
    final platformBrightness = usePlatformBrightness();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: platformBrightness == Brightness.light
            ? Brightness.dark
            : Brightness.light,
      ),
    );

    final router = useMemoized(
      () => GoRouter(
        navigatorKey: key.value,
        refreshListenable: notifier,
        redirect: notifier.redirect,
        routes: AppRoutes.routes,
        initialLocation: AppRoutes.greetingRoute,
        debugLogDiagnostics: kDebugMode,
      ),
      [notifier],
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      routerConfig: router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
