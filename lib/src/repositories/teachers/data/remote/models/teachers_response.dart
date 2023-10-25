import 'package:json_annotation/json_annotation.dart';

part 'teachers_response.g.dart';

@JsonSerializable(createToJson: false)
class TeachersResponse {
  const TeachersResponse({
    required this.teachers,
  });

  factory TeachersResponse.fromJson(Map<String, dynamic> json) =>
      _$TeachersResponseFromJson(json);

  @JsonKey(name: 'teachers')
  final List<TeacherResponse> teachers;
}

@JsonSerializable(createToJson: false)
class TeacherResponse {
  const TeacherResponse({
    required this.name,
  });

  factory TeacherResponse.fromJson(Map<String, dynamic> json) =>
      _$TeacherResponseFromJson(json);

  @JsonKey(name: 'name')
  final String name;
}
