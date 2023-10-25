import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_providers.g.dart';

@riverpod
Future<SharedPreferences> sharedPreferences(
  SharedPreferencesRef ref,
) {
  return SharedPreferences.getInstance();
}
