class PlainDomain {
  const PlainDomain({
    required this.schedule,
  });

  final List<PlainDayDomain> schedule;
}

class PlainDayDomain {
  const PlainDayDomain({
    required this.day,
    required this.date,
    required this.subjects,
  });

  final String day;

  final DateTime date;

  final List<PlainSubjectsDomain> subjects;
}

class PlainSubjectsDomain {
  const PlainSubjectsDomain({
    required this.order,
    required this.kind,
    required this.title,
    required this.time,
  });

  final double order;

  final String kind;

  final String title;

  final PlainSubjectsTimeDomain time;
}

class PlainSubjectsTimeDomain {
  const PlainSubjectsTimeDomain({
    required this.start,
    required this.end,
  });

  final DateTime start;

  final DateTime end;
}
