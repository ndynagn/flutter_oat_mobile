import 'package:dio/dio.dart';
import 'package:flutter_oat_mobile/src/common/providers/dio/dio_providers.dart';
import 'package:flutter_oat_mobile/src/repositories/plain/data/remote/models/plain_response.dart';
import 'package:retrofit/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'plain_api_data_source.g.dart';

@riverpod
PlainApiDataSource plainApiDataSource(PlainApiDataSourceRef ref) {
  final apiClient = ref.watch(apiClientProvider);

  return PlainApiDataSource(apiClient.dio);
}

@RestApi()
abstract class PlainApiDataSource {
  factory PlainApiDataSource(Dio dio, {String? baseUrl}) = _PlainApiDataSource;

  @GET('api/v1/schedules/{week}/plain')
  Future<PlainResponse> getPlain({
    @Path('week') required String week,
  });
}
