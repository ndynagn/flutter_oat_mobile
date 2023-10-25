import 'package:flutter_oat_mobile/src/repositories/plain/data/remote/models/plain_response.dart';
import 'package:flutter_oat_mobile/src/repositories/plain/domain/models/plain_domain.dart';

extension PlainDomainMapper on PlainResponse {
  PlainDomain toPlainDomain() {
    return PlainDomain(
      schedule: schedule.map((e) => e.toPlainDayDomain()).toList(),
    );
  }
}

extension PlainDayDomainMapper on PlainDayResponse {
  PlainDayDomain toPlainDayDomain() {
    return PlainDayDomain(
      day: day,
      date: date,
      subjects: subjects.map((e) => e.toPlainSubjectsDomain()).toList(),
    );
  }
}

extension PlainSubjectsDomainMapper on PlainSubjectsResponse {
  PlainSubjectsDomain toPlainSubjectsDomain() {
    return PlainSubjectsDomain(
      order: order,
      kind: kind,
      title: title,
      time: time.toPlainSubjectsTimeDomain(),
    );
  }
}

extension PlainSubjectsTimeDomainMapper on PlainSubjectsTimeResponse {
  PlainSubjectsTimeDomain toPlainSubjectsTimeDomain() {
    return PlainSubjectsTimeDomain(
      start: start,
      end: end,
    );
  }
}
