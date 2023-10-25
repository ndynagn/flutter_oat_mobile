import 'package:dio/dio.dart';
import 'package:flutter_oat_mobile/src/common/providers/dio/dio_providers.dart';
import 'package:flutter_oat_mobile/src/repositories/teachers/data/remote/models/teachers_response.dart';
import 'package:retrofit/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'teachers_api_data_source.g.dart';

@riverpod
TeachersApiDataSource teachersApiDataSource(TeachersApiDataSourceRef ref) {
  final apiClient = ref.watch(apiClientProvider);
  return TeachersApiDataSource(apiClient.dio);
}

@RestApi()
abstract class TeachersApiDataSource {
  factory TeachersApiDataSource(Dio dio, {String? baseUrl}) =
      _TeachersApiDataSource;

  @GET('/api/v1/teachers')
  Future<TeachersResponse> getTeachers();
}
