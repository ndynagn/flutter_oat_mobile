import 'package:flutter_oat_mobile/src/repositories/groups/domain/models/group_domain.dart';

abstract class GroupsRepository {
  const GroupsRepository._();

  Future<List<GroupDomain>> getGroups();
}
