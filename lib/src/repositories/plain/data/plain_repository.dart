import 'package:flutter_oat_mobile/src/repositories/plain/domain/models/plain_domain.dart';

abstract class PlainRepository {
  const PlainRepository._();

  Future<List<PlainDayDomain>> getPlain(String week);
}
