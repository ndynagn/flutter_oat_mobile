import 'package:json_annotation/json_annotation.dart';

part 'groups_response.g.dart';

@JsonSerializable(createToJson: false)
class GroupsResponse {
  GroupsResponse({
    required this.groups,
  });

  factory GroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$GroupsResponseFromJson(json);

  @JsonKey(name: 'groups')
  final List<GroupResponse> groups;
}

@JsonSerializable(createToJson: false)
class GroupResponse {
  GroupResponse({
    required this.group,
    required this.course,
  });

  factory GroupResponse.fromJson(Map<String, dynamic> json) =>
      _$GroupResponseFromJson(json);

  @JsonKey(name: 'group')
  final String group;

  @JsonKey(name: 'course')
  final int course;
}
