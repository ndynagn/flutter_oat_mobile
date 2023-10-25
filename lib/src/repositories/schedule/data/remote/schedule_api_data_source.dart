import 'package:dio/dio.dart';
import 'package:flutter_oat_mobile/src/repositories/schedule/data/remote/models/schedule_response.dart';
import 'package:retrofit/http.dart';

part 'schedule_api_data_source.g.dart';

@RestApi()
abstract class ScheduleApiDataSource {
  factory ScheduleApiDataSource(Dio dio, {String? baseUrl}) =
      _ScheduleApiDataSource;

  @GET('api/v1/groups/{group}/schedules/{week}')
  Future<ScheduleResponse> getSchedule({
    @Path('group') required String group,
    @Path('week') required String week,
  });
}
