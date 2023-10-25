import 'package:flutter_oat_mobile/src/repositories/teachers/data/remote/models/teachers_response.dart';
import 'package:flutter_oat_mobile/src/repositories/teachers/domain/models/teacher_domain.dart';

extension TeacherDomainMapper on TeacherResponse {
  TeacherDomain toTeacherDomain() {
    return TeacherDomain(name: name);
  }
}
