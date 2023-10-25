class ScheduleDomain {
  const ScheduleDomain({
    required this.variant,
    required this.number,
    required this.schedule,
  });

  final String variant;

  final int number;

  final List<ScheduleDayDomain> schedule;
}

class ScheduleDayDomain {
  const ScheduleDayDomain({
    required this.date,
    required this.day,
    required this.subjectsCount,
    required this.subjects,
  });

  final DateTime date;

  final String day;

  final int subjectsCount;

  final List<ScheduleSubjectsDomain> subjects;
}

class ScheduleSubjectsDomain {
  const ScheduleSubjectsDomain({
    required this.order,
    required this.isRegular,
    required this.time,
    required this.location,
    required this.title,
    required this.teacher,
  });

  final int order;

  final bool isRegular;

  final ScheduleSubjectsTimeDomain time;

  final String location;

  final String title;

  final String teacher;
}

class ScheduleSubjectsTimeDomain {
  const ScheduleSubjectsTimeDomain({
    required this.start,
    required this.end,
  });

  final DateTime start;

  final DateTime end;
}
