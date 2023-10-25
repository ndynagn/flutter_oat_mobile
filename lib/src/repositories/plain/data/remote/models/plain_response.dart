import 'package:json_annotation/json_annotation.dart';

part 'plain_response.g.dart';

@JsonSerializable(createToJson: false)
class PlainResponse {
  const PlainResponse({
    required this.schedule,
  });

  factory PlainResponse.fromJson(Map<String, dynamic> json) =>
      _$PlainResponseFromJson(json);

  @JsonKey(name: 'schedule')
  final List<PlainDayResponse> schedule;
}

@JsonSerializable(createToJson: false)
class PlainDayResponse {
  const PlainDayResponse({
    required this.day,
    required this.date,
    required this.subjects,
  });

  factory PlainDayResponse.fromJson(Map<String, dynamic> json) =>
      _$PlainDayResponseFromJson(json);

  @JsonKey(name: 'day')
  final String day;

  @JsonKey(name: 'date')
  final DateTime date;

  @JsonKey(name: 'subjects')
  final List<PlainSubjectsResponse> subjects;
}

@JsonSerializable(createToJson: false)
class PlainSubjectsResponse {
  const PlainSubjectsResponse({
    required this.order,
    required this.kind,
    required this.title,
    required this.time,
  });

  factory PlainSubjectsResponse.fromJson(Map<String, dynamic> json) =>
      _$PlainSubjectsResponseFromJson(json);

  @JsonKey(name: 'order')
  final double order;

  @JsonKey(name: 'kind')
  final String kind;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'time')
  final PlainSubjectsTimeResponse time;
}

@JsonSerializable(createToJson: false)
class PlainSubjectsTimeResponse {
  const PlainSubjectsTimeResponse({
    required this.start,
    required this.end,
  });

  factory PlainSubjectsTimeResponse.fromJson(Map<String, dynamic> json) =>
      _$PlainSubjectsTimeResponseFromJson(json);

  @JsonKey(name: 'start')
  final DateTime start;

  @JsonKey(name: 'end')
  final DateTime end;
}
