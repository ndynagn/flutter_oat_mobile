import 'package:flutter_oat_mobile/src/repositories/local_storage/data/local/local_storage_data_source.dart';
import 'package:flutter_oat_mobile/src/repositories/local_storage/data/local_storage_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_storage_repository_impl.g.dart';

@riverpod
LocalStorageRepository localStorageRepository(LocalStorageRepositoryRef ref) {
  final dataSource = ref.watch(localStorageDataSourceProvider);
  return LocalStorageRepositoryImpl(dataSource: dataSource);
}

class LocalStorageRepositoryImpl implements LocalStorageRepository {
  LocalStorageRepositoryImpl({
    required this.dataSource,
  });

  final LocalStorageDataSource dataSource;

  @override
  Future<bool> delete({required String key}) {
    return dataSource.delete(key: key);
  }

  @override
  String? getString({required String key}) {
    return dataSource.getString(key: key);
  }

  @override
  Future<bool> setString({required String key, required String value}) {
    return dataSource.setString(key: key, value: value);
  }

  @override
  bool? getBool({required String key}) {
    return dataSource.getBool(key: key);
  }

  @override
  Future<bool> setBool({required String key, required bool value}) {
    return dataSource.setBool(key: key, value: value);
  }
}
