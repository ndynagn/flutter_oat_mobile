import 'package:flutter_oat_mobile/src/repositories/plain/data/plain_repository.dart';
import 'package:flutter_oat_mobile/src/repositories/plain/data/remote/models/mappers/plain_domain_mapper.dart';
import 'package:flutter_oat_mobile/src/repositories/plain/data/remote/plain_api_data_source.dart';
import 'package:flutter_oat_mobile/src/repositories/plain/domain/models/plain_domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'plain_repository_impl.g.dart';

@riverpod
PlainRepository plainRepository(PlainRepositoryRef ref) {
  final dataSource = ref.watch(plainApiDataSourceProvider);
  return PlainRepositoryImpl(dataSource: dataSource);
}

class PlainRepositoryImpl implements PlainRepository {
  const PlainRepositoryImpl({
    required this.dataSource,
  });

  final PlainApiDataSource dataSource;

  @override
  Future<List<PlainDayDomain>> getPlain(String week) {
    return dataSource.getPlain(week: week).then(
          (value) => value.schedule.map((e) => e.toPlainDayDomain()).toList(),
        );
  }
}
