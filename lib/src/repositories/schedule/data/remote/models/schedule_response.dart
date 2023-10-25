import 'package:json_annotation/json_annotation.dart';

part 'schedule_response.g.dart';

@JsonSerializable(createToJson: false)
class ScheduleResponse {
  const ScheduleResponse({
    required this.variant,
    required this.number,
    required this.schedule,
  });

  factory ScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduleResponseFromJson(json);

  @JsonKey(name: 'variant')
  final String variant;

  @JsonKey(name: 'number')
  final int number;

  @JsonKey(name: 'schedule')
  final List<ScheduleDayResponse> schedule;
}

@JsonSerializable(createToJson: false)
class ScheduleDayResponse {
  const ScheduleDayResponse({
    required this.date,
    required this.day,
    required this.subjectsCount,
    required this.subjects,
  });

  factory ScheduleDayResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDayResponseFromJson(json);

  @JsonKey(name: 'date')
  final DateTime date;

  @JsonKey(name: 'day')
  final String day;

  @JsonKey(name: 'subjectsCount')
  final int subjectsCount;

  @JsonKey(name: 'subjects')
  final List<ScheduleSubjectsResponse> subjects;
}

@JsonSerializable(createToJson: false)
class ScheduleSubjectsResponse {
  const ScheduleSubjectsResponse({
    required this.order,
    required this.isRegular,
    required this.time,
    required this.location,
    required this.title,
    required this.teacher,
  });

  factory ScheduleSubjectsResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduleSubjectsResponseFromJson(json);

  @JsonKey(name: 'order')
  final int order;

  @JsonKey(name: 'isRegular')
  final bool isRegular;

  @JsonKey(name: 'time')
  final ScheduleSubjectsTimeResponse time;

  @JsonKey(name: 'location')
  final String location;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'teacher')
  final String teacher;
}

@JsonSerializable(createToJson: false)
class ScheduleSubjectsTimeResponse {
  const ScheduleSubjectsTimeResponse({
    required this.start,
    required this.end,
  });

  factory ScheduleSubjectsTimeResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduleSubjectsTimeResponseFromJson(json);

  @JsonKey(name: 'start')
  final DateTime start;

  @JsonKey(name: 'end')
  final DateTime end;
}
