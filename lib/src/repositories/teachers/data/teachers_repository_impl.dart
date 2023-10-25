import 'package:flutter_oat_mobile/src/repositories/teachers/data/remote/models/mappers/teacher_domain_mapper.dart';
import 'package:flutter_oat_mobile/src/repositories/teachers/data/remote/teachers_api_data_source.dart';
import 'package:flutter_oat_mobile/src/repositories/teachers/data/teachers_repository.dart';
import 'package:flutter_oat_mobile/src/repositories/teachers/domain/models/teacher_domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'teachers_repository_impl.g.dart';

@riverpod
TeachersRepository teachersRepository(TeachersRepositoryRef ref) {
  final dataSource = ref.watch(teachersApiDataSourceProvider);
  return TeachersRepositoryImpl(dataSource: dataSource);
}

class TeachersRepositoryImpl implements TeachersRepository {
  const TeachersRepositoryImpl({
    required this.dataSource,
  });

  final TeachersApiDataSource dataSource;

  @override
  Future<List<TeacherDomain>> getTeachers() {
    return dataSource.getTeachers().then(
          (value) => value.teachers.map((e) => e.toTeacherDomain()).toList(),
        );
  }
}
