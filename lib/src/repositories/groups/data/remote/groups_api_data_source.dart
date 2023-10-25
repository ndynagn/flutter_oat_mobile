import 'package:dio/dio.dart';
import 'package:flutter_oat_mobile/src/common/providers/dio/dio_providers.dart';
import 'package:flutter_oat_mobile/src/repositories/groups/data/remote/models/groups_response.dart';
import 'package:retrofit/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'groups_api_data_source.g.dart';

@riverpod
GroupsApiDataSource groupsApiDataSource(GroupsApiDataSourceRef ref) {
  final apiClient = ref.watch(apiClientProvider);
  return GroupsApiDataSource(apiClient.dio);
}

@RestApi()
abstract class GroupsApiDataSource {
  factory GroupsApiDataSource(Dio dio, {String? baseUrl}) =
      _GroupsApiDataSource;

  @GET('/api/v1/groups')
  Future<GroupsResponse> getGroups();
}
