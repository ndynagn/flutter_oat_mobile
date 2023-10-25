double weeksBetween({
  required DateTime dateFrom,
  required DateTime dateTo,
}) {
  final from = DateTime.utc(
    dateFrom.year,
    dateFrom.month,
    dateFrom.day,
    dateFrom.hour,
    dateFrom.minute,
    dateFrom.second,
    dateFrom.millisecond,
    dateFrom.microsecond,
  );
  final to = DateTime.utc(
    dateTo.year,
    dateTo.month,
    dateTo.day,
    dateTo.hour,
    dateTo.minute,
    dateTo.second,
    dateTo.millisecond,
    dateTo.microsecond,
  );
  return dateTo.difference(dateFrom).inDays / 7;
}
