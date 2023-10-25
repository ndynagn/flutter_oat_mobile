import 'package:flutter_oat_mobile/src/repositories/groups/data/remote/models/groups_response.dart';
import 'package:flutter_oat_mobile/src/repositories/groups/domain/models/group_domain.dart';

extension GroupDomainMapper on GroupResponse {
  GroupDomain toGroupDomain() {
    return GroupDomain(group: group, course: course);
  }
}
