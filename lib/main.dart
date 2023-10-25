import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_oat_mobile/src/app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl_standalone.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  await findSystemLocale();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
