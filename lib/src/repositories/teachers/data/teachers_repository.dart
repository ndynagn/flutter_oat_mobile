import 'package:flutter_oat_mobile/src/repositories/teachers/domain/models/teacher_domain.dart';

abstract class TeachersRepository {
  const TeachersRepository._();

  Future<List<TeacherDomain>> getTeachers();
}
