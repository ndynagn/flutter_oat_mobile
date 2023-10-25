import 'package:flutter_oat_mobile/src/repositories/groups/data/groups_repository.dart';
import 'package:flutter_oat_mobile/src/repositories/groups/data/remote/groups_api_data_source.dart';
import 'package:flutter_oat_mobile/src/repositories/groups/data/remote/models/mappers/group_domain_mapper.dart';
import 'package:flutter_oat_mobile/src/repositories/groups/domain/models/group_domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'groups_repository_impl.g.dart';

@riverpod
GroupsRepository groupsRepository(GroupsRepositoryRef ref) {
  final dataSource = ref.watch(groupsApiDataSourceProvider);
  return GroupsRepositoryImpl(dataSource: dataSource);
}

class GroupsRepositoryImpl implements GroupsRepository {
  const GroupsRepositoryImpl({
    required this.dataSource,
  });

  final GroupsApiDataSource dataSource;

  @override
  Future<List<GroupDomain>> getGroups() {
    return dataSource.getGroups().then(
          (value) => value.groups.map((e) => e.toGroupDomain()).toList(),
        );
  }
}
