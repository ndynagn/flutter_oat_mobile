abstract class LocalStorageRepository {
  LocalStorageRepository._();

  Future<bool> setBool({
    required String key,
    required bool value,
  });

  bool? getBool({required String key});

  Future<bool> setString({
    required String key,
    required String value,
  });

  String? getString({required String key});

  Future<bool> delete({required String key});
}
