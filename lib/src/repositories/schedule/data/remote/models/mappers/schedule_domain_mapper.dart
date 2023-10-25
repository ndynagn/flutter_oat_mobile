import 'package:flutter_oat_mobile/src/repositories/schedule/data/remote/models/schedule_response.dart';
import 'package:flutter_oat_mobile/src/repositories/schedule/domain/models/schedule_domain.dart';

extension ScheduleDomainMapper on ScheduleResponse {
  ScheduleDomain toScheduleDomain() {
    return ScheduleDomain(
      variant: variant,
      number: number,
      schedule: schedule.map((e) => e.toScheduleDayDomain()).toList(),
    );
  }
}

extension ScheduleDayDomainMapper on ScheduleDayResponse {
  ScheduleDayDomain toScheduleDayDomain() {
    return ScheduleDayDomain(
      date: date,
      day: day,
      subjectsCount: subjectsCount,
      subjects: subjects.map((e) => e.toScheduleSubjectsDomain()).toList(),
    );
  }
}

extension ScheduleSubjectsDomainMapper on ScheduleSubjectsResponse {
  ScheduleSubjectsDomain toScheduleSubjectsDomain() {
    return ScheduleSubjectsDomain(
      order: order,
      isRegular: isRegular,
      time: time.toScheduleSubjectsTimeDomain(),
      location: location,
      title: title,
      teacher: teacher,
    );
  }
}

extension ScheduleSubjectsTimeDomainMapper on ScheduleSubjectsTimeResponse {
  ScheduleSubjectsTimeDomain toScheduleSubjectsTimeDomain() {
    return ScheduleSubjectsTimeDomain(
      start: start,
      end: end,
    );
  }
}
