import 'package:flutter_oat_mobile/src/common/providers/shared_preferences/shared_preferences_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'local_storage_data_source.g.dart';

@riverpod
LocalStorageDataSource localStorageDataSource(
  LocalStorageDataSourceRef ref,
) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return LocalStorageDataSource(
    sharedPreferences: sharedPreferences.value!,
  ); //!TODO
}

class LocalStorageDataSource {
  LocalStorageDataSource({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  Future<bool> setBool({
    required String key,
    required bool value,
  }) {
    return sharedPreferences.setBool(key, value);
  }

  bool? getBool({required String key}) {
    return sharedPreferences.getBool(key);
  }

  String? getString({required String key}) {
    return sharedPreferences.getString(key);
  }

  Future<bool> setString({
    required String key,
    required String value,
  }) {
    return sharedPreferences.setString(key, value);
  }

  Future<bool> delete({required String key}) {
    return sharedPreferences.remove(key);
  }
}
